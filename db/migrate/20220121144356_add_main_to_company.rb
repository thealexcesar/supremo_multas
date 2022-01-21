class AddMainToCompany < ActiveRecord::Migration[5.2]
  def change
    add_reference :companies, :company, foreign_key: true
  end
end
