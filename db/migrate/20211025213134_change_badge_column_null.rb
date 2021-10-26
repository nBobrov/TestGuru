class ChangeBadgeColumnNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :badges, :rule_type, false
  end
end
