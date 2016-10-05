cat1 = Cat.create!(name: "Ear", birth_date: "2015/01/20", color: "black", sex: "M")
cat2 = Cat.create!(name: "Pie", birth_date: "2013/12/25", color: "blue", sex: "M")

catrequest1 = CatRentalRequest.create!(cat_id: 1, start_date: "2012/12/12", end_date: "2012/12/14")
catrequest2 = CatRentalRequest.create!(cat_id: 2, start_date: "2012/7/4", end_date: "2012/7/14")
catrequest1.update(status: "APPROVED")
