class Fine < ApplicationRecord
  belongs_to :user
  belongs_to :branch, class_name: "Company", foreign_key: :branch_id
  belongs_to :detran, class_name: "State", foreign_key: :detran_id
  belongs_to :fine_point
  belongs_to :company
  belongs_to :created_by, class_name: "User", foreign_key: :created_by

  enum fine_status: [:identified, :unidentified]
  
  validates :fine_number, presence: true, uniqueness: true
end
