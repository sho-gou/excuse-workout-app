class AddTodoToSurvivalLogs < ActiveRecord::Migration[7.2]
  def change
    add_column :survival_logs, :todo, :string
  end
end
