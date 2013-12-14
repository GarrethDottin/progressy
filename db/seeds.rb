# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#Create users
jill = User.create username: "jillmeister", email: "jill@jill.com", password: "password"
jill.is_admin = true
jill.save

jack = User.create username: "jackmeister", email: "jack@jack.com", password: "password"
bob = User.create username: "bobmeister", email: "bob@bob.com", password: "password"

# Create lists
list_ruby = List.create name: "Ruby"
list_javascript = List.create name: "JavaScript"
list_tdd = List.create name: "TDD"

# Create topics
topic_ruby_recursion = Topic.create name: "Recursion", list_id: 1
topic_ruby_varialbes = Topic.create name: "Variables", list_id: 1
topic_ruby_methods = Topic.create name: "Methods", list_id: 1
topic_ruby_oo = Topic.create name: "Object Orientation", list_id: 1

topic_javascript_functions = Topic.create name: "Functions", list_id: 2
topic_javascript_closures = Topic.create name: "Closures", list_id: 2
topic_javascript_design_patterns = Topic.create name: "Design Patterns", list_id: 2

topic_tdd_rspec = Topic.create name: "RSpec", list_id: 3
topic_tdd_jasmine = Topic.create name: "Jasmine", list_id: 3
topic_tdd_capybara = Topic.create name: "Capybara", list_id: 3

# Save users
jill.save
jack.save
bob.save

Topic.all.each do |topic|
  User.all.each do |user|
    UserTopic.create(user_id: user.id, topic_id: topic.id, rating: 0)
  end
end

jill.history[0] = ["Date", "Ruby", "JavaScript", "TDD"]
jill.history[1] = ["2013-12-09", 2, 1, 3]
jill.history.push(["2013-12-10", 3, 2, 5])
jill.history.push(["2013-12-11", 2, 3, 5])
jill.history.push(["2013-12-12", 3, 5, 5])
jill.history.push(["2013-12-13", 5, 5, 6])
jill.save

jack.history[0] = ["Date", "Ruby", "JavaScript", "TDD"]
jack.history[1] = ["2013-12-09", 0, 0, 1]
jack.history.push(["2013-12-10", 0, 0, 2])
jack.history.push(["2013-12-11", 1, 0, 2])
jack.history.push(["2013-12-12", 1, 0, 2])
jack.history.push(["2013-12-13", 1, 0, 2])
jack.save

bob.history[0] = ["Date", "Ruby", "JavaScript", "TDD"]
bob.history[1] = ["2013-12-09", 1, 1, 2]
bob.history.push(["2013-12-10", 3, 2, 2])
bob.history.push(["2013-12-11", 5, 5, 4])
bob.history.push(["2013-12-12", 3, 4, 2])
bob.history.push(["2013-12-13", 1, 2, 1])
bob.save