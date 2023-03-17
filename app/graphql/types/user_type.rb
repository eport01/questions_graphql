# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :email, String
    field :password_digest, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :t_questions, [Types::TQuestionType]

    # field :tech, Types::TQuestionType, null: true
    # def tech 
    #   TQuestion.joins(:user_t_questions)
    #   .where("user_t_questions.user_id = #{object.id}")
    # end

    # field :b_questions, Types::BQuestionType, null: true
  end
end
