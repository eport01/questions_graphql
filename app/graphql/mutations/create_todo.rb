module Mutations
  class CreateTodo < Mutations::BaseMutation
    argument :item, String, required: true 
    argument :user_id, Integer, required: true 

    field :user, Types::UserType, null: false 
    field :todo, Types::TodoType, null: false 
    field :errors, [String], null: false 

    def resolve(item:, user_id:)
      user = User.find(user_id)
      todo= Todo.create!(user_id: user.id, item: item)

      {todo: todo, errors: []}

    end
    
  end
end
