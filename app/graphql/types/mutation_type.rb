module Types
  class MutationType < Types::BaseObject
    field :create_user_b_question, mutation: Mutations::CreateUserBQuestion
    field :update_user_b_question, mutation: Mutations::UpdateUserBQuestion
    field :update_user_t_question, mutation: Mutations::UpdateUserTQuestion
    field :create_user, mutation: Mutations::Users::CreateUser

  end
end
