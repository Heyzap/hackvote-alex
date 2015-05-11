# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

old = Hackday.create(:name => "old hackday", :votable => false)
old.projects.create(:name => "project 1", :creators => "Alessio", :votes => 3)
old.projects.create(:name => "project 2", :creators => "Alessio", :votes => 15)
old.projects.create(:name => "project 3", :creators => "Alessio", :votes => 6)
old.projects.create(:name => "project 4", :creators => "Alessio", :votes => 1)
old.projects.create(:name => "project 5", :creators => "Alessio", :votes => 3)

Hackday.create(:name => "Asdf")
