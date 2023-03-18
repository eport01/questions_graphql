module Mutations
  class UpdateUserTQuestion < Mutations::BaseMutation
    argument :id, ID, required: true 
    argument :user_id, Integer, required: true 
    argument :t_question_id, Integer, required: true 
    argument :status, Integer, required: true 
    argument :answer, String, required: true 
    field :errors, String, null: true
    field :user_t_question, Types::UserTQuestionType, null: true 

    def resolve(id:, user_id:, t_question_id:, status:, answer:)
      user_t_question = UserTQuestion.find_by(id: id)
      if !user_t_question.nil?
        user_t_question.update(user_id: user_id, t_question_id: t_question_id, status: status, answer: answer)
        updated_user_t_question = UserTQuestion.find_by(id: id)
        {
          user_t_question: {
            id: id,
            user_id: user_id,
            t_question_id: t_question_id,
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
