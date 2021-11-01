class EditEndTimeTestPassages < ActiveRecord::Migration[6.1]
  def change
    change_column :test_passages, :end_time, :integer, limit: 6, null: true
  end
end
