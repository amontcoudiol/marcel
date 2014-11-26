# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

a = 0
birthday = "12/11/1985".to_date

9.times do
  first_names = ["Jack", "Monica", "Jim", "Victoria", "Bill", "Pamela", "Bobby", "Scarlett", "Jimmy"]
  birthday = birthday >> 12
  if a.even?
    User.create(first_name: first_names[a], birthday: birthday, gender: "male", password: "qwertzuiop", email: "yo#{a}@gmail.com")
  else
    User.create(first_name: first_names[a], birthday: birthday, gender: "female", password: "qwertzuiop", email: "yo#{a}@gmail.com")
  end
  a += 1
end

User.create(first_name: "Moi", target_gender: "female", target_min_age: 20, target_max_age: 30, gender: "male", password: "qwertzuiop", email: "moi@gmail.com")