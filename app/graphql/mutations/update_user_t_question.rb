module Mutations
  class UpdateUserTQuestion < Mutations::BaseMutation
    argument :id, ID, required: true 
    # argument :user_id, Integer, required: true 
    # argument :t_question_id, Integer, required: true 
    argument :status, Integer, required: true 
    argument :answer, String, required: true 
    field :errors, String, null: true
    field :user_t_question, Types::UserTQuestionType, null: true 
    field :t_question, [Types::TQuestionType], null: false 

    def t_question
      TQuestion.find(object.t_question_id)
    end

    def resolve(id:, status:, answer:)
      user_t_question = UserTQuestion.find_by(id: id)
      if !user_t_question.nil?
        user_t_question.update(status: status, answer: answer)
        # updated_user_t_question = UserTQuestion.find_by(id: id)
        {
          user_t_question: {
            id: id,
            status: status,
            answer: answer
          },
          errors: []
        }
      else
        {
          user_t_question: nil, 
          errors: []
        }   
      end 
    end
  end
end
