class Report < ApplicationRecord
  belongs_to :user
  has_one :basic_report, dependent: :destroy
  has_one :wellness_report, dependent: :destroy
  has_one :anxiety_report, dependent: :destroy
end
