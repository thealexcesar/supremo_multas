class Fine < ApplicationRecord
  belongs_to :user
  belongs_to :branch, class_name: "Company", foreign_key: :branch_id
  enum fine_status: [:identified, :unidentified]

  validates :fine_date, :fine_number, :fine_status, presence: true
end
