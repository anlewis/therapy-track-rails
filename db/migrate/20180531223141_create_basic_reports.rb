class CreateBasicReports < ActiveRecord::Migration[5.1]
  def change
    create_table :basic_reports do |t|
      t.integer :oxygen
      t.integer :temperature
      t.integer :systolic
      t.integer :diastolic
      t.text :notes
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end
