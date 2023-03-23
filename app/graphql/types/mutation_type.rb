module Types
  class MutationType < Types::BaseObject
    field :create_user_t_question, mutation: Mutations::CreateUserTQuestion
    field :create_user_b_question, mutation: Mutations::CreateUserBQuestion
    field :update_user_b_question, mutation: Mutations::UpdateUserBQuestion
    field :update_user_t_question, mutation: Mutations::UpdateUserTQuestion
    field :create_user, mutation: Mutations::CreateUser
    field :signin_user, mutation: Mutations::SignInUser
  end
end
