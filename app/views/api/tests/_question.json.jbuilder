json.extract! question, :id, :title, :description
json.answers do
  json.array! question.answers, partial: 'api/tests/answer', as: :answer
end
