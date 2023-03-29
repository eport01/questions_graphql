# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :uid, Integer 
    field :name, String
    field :email, String
    field :token, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :t_questions, [Types::TQuestionType]
    field :b_questions, [Types::BQuestionType]

    field :user_t_questions, [Types::UserTQuestionType]
    field :user_b_questions, [Types::UserBQuestionType]



    
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

    field :active_behav_ques, [Types::BQuestionType]
    def active_behav_ques
      BQuestion.joins(:user_b_questions)
      .where("user_b_questions.user_id = #{object.id}")
      .where("user_b_questions.status = 0")
    end

    field :inactive_behav_ques, [Types::BQuestionType]
    def inactive_behav_ques
      BQuestion.joins(:user_b_questions)
      .where("user_b_questions.user_id = #{object.id}")
      .where("user_b_questions.status = 1")
    end

    field :favorited_behav_ques, [Types::BQuestionType]
    def favorited_behav_ques
      BQuestion.joins(:user_b_questions)
      .where("user_b_questions.user_id = #{object.id}")
      .where("user_b_questions.status = 2")
    end
  end
end
