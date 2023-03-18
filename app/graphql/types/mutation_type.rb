module Types
  class MutationType < Types::BaseObject
    field :update_user_t_question, mutation: Mutations::UpdateUserTQuestion
    field :create_user, mutation: Mutations::Users::CreateUser

  end
end
