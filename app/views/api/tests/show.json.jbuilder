json.partial! "api/tests/test", test: @test
json.questions do
  json.array! @test.questions, partial: 'api/tests/question', as: :question
end
