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
  end
end