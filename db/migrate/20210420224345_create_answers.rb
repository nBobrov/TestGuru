class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.text :body, null: false
      t.boolean :correct, default: false
      t.references :question, index: true, foreign_key: { to_table: :questions }

      t.timestamps
    end
  end
end
