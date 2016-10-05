RENTAL_STATUS = ['PENDING', 'APPROVED', 'DENIED']

class CatRentalRequest < ActiveRecord::Base

  validates :cat_id, presence: true
  validates :status, inclusion: {in: RENTAL_STATUS, message: "Invalid status"}
  validate :overlapping_approved_requests?

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat

  def overlapping_requests
    CatRentalRequest.where("cat_id = ? AND ((end_date BETWEEN ? AND ?) OR (start_date BETWEEN ? AND ?))", :cat_id, :start_date, :end_date, :start_date, :end_date)
  end

  def overlapping_approved_requests
    overlapping_requests.where("status = ?", "APPROVED")
  end

  def overlapping_approved_requests?
    unless overlapping_approved_requests.empty?
      errors[:overlapping] << "rentals"
    end
  end
end
