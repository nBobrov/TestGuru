class CreateUserTests < ActiveRecord::Migration[6.1]
  def change
    create_table :user_tests do |t|
      t.boolean :finished, default: false
      t.references :test, index: true, foreign_key: { to_table: :tests }
      t.references :user, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
