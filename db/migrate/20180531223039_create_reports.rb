class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.integer :status, default: 0
      t.datetime :start_date
      t.datetime :end_date, default: -> { 'CURRENT_TIMESTAMP' }
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
