class AddPassingTimeToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :passing_time, :integer, null: true
  end
end
