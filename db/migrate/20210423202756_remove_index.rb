class RemoveIndex < ActiveRecord::Migration[6.1]
  def change
    remove_index "tests_users", name: "index_tests_users_on_user_id_and_test_id"
  end
end
