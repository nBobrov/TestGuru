class User < ApplicationRecord
  def find_tests_by_level(level)
    Test.joins('JOIN user_tests ON user_tests.test_id = tests.id').where('user_tests.user_id = ? AND level = ?', id, level)
  end
end
