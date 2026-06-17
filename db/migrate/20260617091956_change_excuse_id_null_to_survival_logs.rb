class ChangeExcuseIdNullToSurvivalLogs < ActiveRecord::Migration[7.2]
  def change
    change_column_null :survival_logs, :excuse_id, true
  end
end
