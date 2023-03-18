class ChangeDefaultValueUserTQuestion < ActiveRecord::Migration[5.2]
  def change
    change_column_default :user_b_questions, :status, 0  
  end
end
