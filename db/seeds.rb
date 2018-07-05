# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command (or created
# alongside the database with db:setup).
#
# Examples:
#
#  movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#  Character.create(name: 'Luke', movie: movies.first)

cat = []
cat[0] = Category.create!(title: 'Frontend')
cat[1] = Category.create!(title: 'Backend')
cat[2] = Category.create!(title: 'Database')

Test.create!(
  [
    { title: 'Ruby', category_id: cat[1].id, level: 2 },
    { title: 'HTML', category_id: cat[0].id },
    { title: 'Vue.js', category_id: cat[0].id, level: 2 },
    { title: 'jQuery', category_id: cat[0].id },
    { title: 'PHP', category_id: cat[1].id },
    { title: 'MySQL', category_id: cat[2].id, level: 2 },
    { title: 'MongoDB', category_id: cat[2].id }
  ]
)

User.create!(
  [
    { username: 'Admin' },
    { username: 'User' }
  ]
)

k = 1
14.times do |i|
  Question.create(test_id: k, body: "Question #{i}")
  2.times do |m|
    Answer.create(question_id: i, body: "Answer #{m}", correct: m.odd?)
  end
  k += 1 if i.odd?
end

UserTests.create(
  [
    { user_id: 1, test_id: 1 },
    { user_id: 1, test_id: 3 },
    { user_id: 1, test_id: 4 },
    { user_id: 1, test_id: 5 }
  ]
)
