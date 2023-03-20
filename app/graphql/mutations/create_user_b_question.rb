module Mutations
  class CreateUserBQuestion < Mutations::BaseMutation
    argument :user_id, Integer, required: true 
    argument :b_question_id, Integer, required: true 
    argument :answer, String, required: true

    field :errors, String, null: true
    field :user, Types::UserType, null: false 

    field :user_b_question, Types::UserBQuestionType, null: false 
    field :b_question, [Types::BQuestionType], null: false 

    def resolve(user_id:, b_question_id:, answer:)
      user = User.find(user_id)
      b_question = BQuestion.find(b_question_id)
  
      user_b_question = UserBQuestion.create!(user_id: user.id, b_question_id: b_question.id, status: 1, answer: answer)
      #default status is 0, unanswered
      #answered question is 1
      {
        user_b_question: user_b_question, 
        errors: []
      }
    end

  end 
end
