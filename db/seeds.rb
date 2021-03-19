# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "teacher 1", email: "teacher@example.com", password: "12345678", role: :teacher)

(1..10).each do |t_i|
  test = Test.new(name: "Test [#{t_i}]", description: "Test description [#{t_i}]")
  test.questions = (1..10).map do |q_i|
                question = Question.new(title: "Question [#{t_i}-#{q_i}]", description: "Question description [#{t_i}-#{q_i}]")
                correct_number = (1..4).to_a.sample
                question.answers = (1..4).map do |a_i|
                          Answer.new(result: "This is result [#{a_i}]", correct: (a_i == correct_number))
                        end
                question
              end
  test.save
end
