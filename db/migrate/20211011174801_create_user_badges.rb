class CreateUserBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :user_badges do |t|
      t.references :badge, index: true, null: false, foreign_key: { to_table: :badges }
      t.references :user, index: true, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
