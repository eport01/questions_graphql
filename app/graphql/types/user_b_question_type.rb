# frozen_string_literal: true

module Types
  class UserBQuestionType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer
    field :b_question_id, Integer
    field :answer, String
    field :status, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  
    delegate :user, to: :object 
    delegate :b_question, to: :object 
    
    field :b_question, Types::BQuestionType, null: false do 
    end
    def b_question
      BQuestion.find(object.b_question_id)
    end
  end
end
