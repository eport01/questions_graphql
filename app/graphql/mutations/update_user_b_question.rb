module Mutations
  class UpdateUserBQuestion < Mutations::BaseMutation
    argument :id, ID, required: true 
    argument :user_id, Integer, required: true 
    argument :b_question_id, Integer, required: true 
    argument :status, Integer, required: true 
    argument :answer, String, required: true 
    field :errors, String, null: true
    field :user_b_question, Types::UserBQuestionType, null: true 

    def resolve(id:, status:, answer:)
      user_b_question = UserBQuestion.find_by(id: id)
      if !user_b_question.nil?
        user_b_question.update(status: status, answer: answer)
        updated_user_b_question = UserBQuestion.find_by(id: id)
        {
          user_b_question: {
            id: id,
            b_question_id: b_question_id,
            status: status,
            answer: answer
          },
          errors: []
        }
      else
        {
          user_b_question: nil, 
          errors: []
        }   
      end 
    end
  end
end
