# frozen_string_literal: true

module Types
  class UserTQuestionType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer
    field :t_question_id, Integer
    field :answer, String
    field :status, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    delegate :user, to: :object 
    delegate :t_question, to: :object 
    
   
    
    field :t_question, Types::TQuestionType, null: false do 
    end
    def t_question
      TQuestion.find(object.t_question_id)
    end

  end
end
