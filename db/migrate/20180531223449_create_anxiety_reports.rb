class CreateAnxietyReports < ActiveRecord::Migration[5.1]
  def change
    create_table :anxiety_reports do |t|
      t.integer :q1
      t.integer :q2
      t.integer :q3
      t.integer :q4
      t.integer :q5
      t.integer :q6
      t.integer :q7
      t.integer :difficulty_level
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end
