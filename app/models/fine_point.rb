class FinePoint < ApplicationRecord
  belongs_to :company
  belongs_to :created_by, class_name: "User", foreign_key: :created_by
end
