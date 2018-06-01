class Report < ApplicationRecord
  belongs_to :user
  has_one :basic_report, dependent: :destroy
end
