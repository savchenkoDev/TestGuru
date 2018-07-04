# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command (or created
# alongside the database with db:setup).
#
# Examples:
#
#  movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#  Character.create(name: 'Luke', movie: movies.first)

Category.create(title: 'Frontend')
Category.create(title: 'Backend')
Category.create(title: 'Database')
Test.create(title: 'Ruby', category_id: 2, level: 2)
Test.create(title: 'HTML', category_id: 1)
Test.create(title: 'Vue.js', category_id: 1, level: 2)
Test.create(title: 'jQuery', category_id: 1)
Test.create(title: 'PHP', category_id: 2)
Test.create(title: 'MySQL', category_id: 3, level: 2)
Test.create(title: 'MongoDB', category_id: 3)

User.create(username: 'Admin')
User.create(username: 'User')
k = 1
14.times do |i|
  Question.create(test_id: k, body: "Question #{i+1}")
  2.times do |m|
    correct = m.odd? ? true : false
    Answer.create(question_id: i, body: "Answer #{m}", correct: correct)
  end
  k += 1 if i.odd?
end

UserTests.create(user_id: 1, test_id: 1)
UserTests.create(user_id: 1, test_id: 3)
UserTests.create(user_id: 1, test_id: 4)
UserTests.create(user_id: 1, test_id: 5)
