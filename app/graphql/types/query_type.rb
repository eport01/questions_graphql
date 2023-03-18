module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :users, [Types::UserType], null: false

    def users 
      User.all 
    end

    field :user, Types::UserType, null: false do 
      argument :id, ID, required: true 
    end

    def user(id:)
      User.find(id)
    end

    field :t_questions, [Types::TQuestionType], null: false 
    def t_questions 
      TQuestion.all 
    end

    field :t_question, Types::TQuestionType, null: false do 
      argument :id, ID, required: true 
    end

    def t_question(id:)
      TQuestion.find(id)
    end


    field :b_questions, [Types::BQuestionType], null: false 
    def b_questions 
      BQuestion.all 
    end

    field :b_question, Types::BQuestionType, null: false do 
      argument :id, ID, required: true 
    end

    def b_question(id:)
      BQuestion.find(id)
    end

    field :user_t_question, Types::UserTQuestionType, null: false do 
      argument :id, ID, required: true 
    end

    def user_t_question(id:)
      UserTQuestion.find(id)
    end

    field :user_b_question, Types::UserBQuestionType, null: false do 
      argument :id, ID, required: true 
    end

    def user_b_question(id:)
      UserBQuestion.find(id)
    end


  end
end
