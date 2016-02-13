# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

customer1 = Customer.create title: 'Customer 1', comment: 'My first customer'
customer2 = Customer.create title: 'Customer 2', comment: 'My second customer'

project1 = Project.create title: 'My first project', location: 'Russia', status: 0

user1 = User.create first_name: 'Ilya', last_name: 'Timofeev', position: 'programmer'

assign1 = Assignment.create date: DateTime.current, user: user1, project: project1

entry1 = TableEntry.create user: user1, project: project1, duration: 8, date: DateTime.current, comment: 'nothing special'

