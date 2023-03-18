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
    field :b_questions, [Types::BQuestionType]

    field :active_tech_ques, [Types::TQuestionType]
    def active_tech_ques
      TQuestion.joins(:user_t_questions)
      .where("user_t_questions.user_id = #{object.id}")
      .where("user_t_questions.status = 0")
    end

    field :inactive_tech_ques, [Types::TQuestionType]
    def inactive_tech_ques
      TQuestion.joins(:user_t_questions)
      .where("user_t_questions.user_id = #{object.id}")
      .where("user_t_questions.status = 1")
    end

    field :favorited_tech_ques, [Types::TQuestionType]
    def favorited_tech_ques
      TQuestion.joins(:user_t_questions)
      .where("user_t_questions.user_id = #{object.id}")
      .where("user_t_questions.status = 2")
    end

  end
end
