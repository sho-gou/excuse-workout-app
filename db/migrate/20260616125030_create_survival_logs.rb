class CreateSurvivalLogs < ActiveRecord::Migration[7.2]
  def change
    create_table :survival_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :excuse, null: false, foreign_key: true
      t.integer :report_status
      t.date :reported_on

      t.timestamps
    end
  end
end
