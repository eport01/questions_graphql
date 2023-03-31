module Mutations
  class DeleteTodo < Mutations::BaseMutation
    argument :id, ID, required: true 

    field :todo, Types::TodoType, null:false 
    field :errors, [String], null: false 
    field :message, String, null: false 

    def resolve(id:)
      todo = Todo.find(id)
      todo.destroy!
      {
        message: "Item successfully deleted from todo list!", 
        errors: []
      }



    end
    
  end
end
