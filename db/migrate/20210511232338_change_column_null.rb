class ChangeColumnNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :name, true, 1
  end
end
