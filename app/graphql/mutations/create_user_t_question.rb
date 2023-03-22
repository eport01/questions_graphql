module Mutations
  class CreateUserTQuestion < Mutations::BaseMutation
    # argument :user_id, Integer, required: true 
    argument :t_question_id, Integer, required: true 
    argument :answer, String, required: true

    field :errors, String, null: true
    field :user, Types::UserType, null: false 

    field :user_t_question, Types::UserTQuestionType, null: false 
    field :t_question, [Types::TQuestionType], null: false 

    def resolve(t_question_id:, answer:)
      # user = User.find(user_id)
      t_question = TQuestion.find(t_question_id)
  
      user_t_question = UserTQuestion.create!(user: context[:current_user], t_question_id: t_question.id, status: 1, answer: answer)
      #default status is 0, unanswered
      #answered question is 1
      {
        user_t_question: user_t_question, 
        errors: []
      }
    end

  end 
end
