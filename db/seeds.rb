# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command (or created
# alongside the database with db:setup).
#
# Examples:
#
#  movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#  Character.create(name: 'Luke', movie: movies.first)

cat = Category.create!(
  [
    { title: 'Frontend' },
    { title: 'Backend' },
    { title: 'Database' }
  ]
)

users = User.create!(
  [
    { username: 'Admin' },
    { username: 'User1' },
    { username: 'User2' },
    { username: 'User3' }
  ]
)

tests = Test.create!(
  [
    { title: 'Ruby', category_id: cat[1].id, level: 2, author_id: users[0].id },
    { title: 'HTML', category_id: cat[0].id, author_id: users[1].id },
    { title: 'Vue.js', category_id: cat[0].id, level: 2, author_id: users[2].id },
    { title: 'jQuery', category_id: cat[0].id, author_id: users[3].id },
    { title: 'PHP', category_id: cat[1].id, author_id: users[0].id },
    { title: 'MySQL', category_id: cat[2].id, level: 2, author_id: users[1].id },
    { title: 'MongoDB', category_id: cat[2].id, author_id: users[3].id }
  ]
)

k = 0
14.times do |i|
  quest = Question.create(test_id: tests[k].id, body: "Question #{i}")
  2.times do |m|
    Answer.create(question_id: quest.id, body: "Answer #{m}", correct: m.odd?)
  end
  k += 1 if i.odd?
end

TestsUser.create!(
  [
    { user_id: users[0].id, test_id: tests[0].id, result: rand(10..100) },
    { user_id: users[0].id, test_id: tests[1].id, result: rand(10..100) },
    { user_id: users[1].id, test_id: tests[1].id, result: rand(10..100) },
    { user_id: users[1].id, test_id: tests[3].id, result: rand(10..100) },
    { user_id: users[2].id, test_id: tests[4].id, result: rand(10..100) },
    { user_id: users[3].id, test_id: tests[5].id, result: rand(10..100) }
  ]
)
