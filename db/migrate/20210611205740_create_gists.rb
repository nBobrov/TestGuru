class CreateGists < ActiveRecord::Migration[6.1]
  def change
    create_table :gists do |t|
      t.string :url, null: false
      t.references :question, index: true, foreign_key: { to_table: :questions }
      t.references :user, index: true, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
