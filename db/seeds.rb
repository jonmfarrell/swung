# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



# TODO: SEED GENDERS

["Man", "Woman", "Gender Queer"].each{|gender| Gender.find_or_create_by(name: gender)}

User.find_or_create_by(name: "Bob", gender_id: 1)
User.find_or_create_by(name: "Jane", gender_id: 2)
User.find_or_create_by(name: "Sam", gender_id: 3)