COLORS =
  ['red', 'orange', 'yellow', 'green', 'blue', 'black', 'grey']
class Cat < ActiveRecord::Base
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: {in: COLORS, message: "%{value} is not a valid color"}
  validates :sex, inclusion: {in: %w(M F), message: "%{value} is not a valid sex"}

  def age
    Date.today.cwyear - @birth_date.cwyear
  end
end
