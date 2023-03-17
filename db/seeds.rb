# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do 
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email, password_digest: Faker::Internet.password )
  t_question = TQuestion.create(question: Faker::Quote.yoda, q_type: Faker::Number.between(from: 1, to: 2) )
  5.times do 
    user.user_t_questions.create(user_id: user.id, t_question_id: t_question.id, answer: Faker::Quote.famous_last_words, status: Faker::Number.between(from: 1, to: 3))
  end
end
