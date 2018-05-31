class CreateWellnessReports < ActiveRecord::Migration[5.1]
  def change
    create_table :wellness_reports do |t|
      t.integer :avg_sleep
      t.integer :avg_heartrate
      t.integer :weight
      t.integer :bmi
      t.integer :weight_change
      t.integer :avg_daily_exercise
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end
