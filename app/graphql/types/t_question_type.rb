# frozen_string_literal: true

module Types
  class TQuestionType < Types::BaseObject
    field :id, ID, null: false
    field :question, String
    field :q_type, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :users, [Types::UserType] 



  end
end
