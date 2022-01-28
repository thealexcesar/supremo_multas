class AddFinePointToFine < ActiveRecord::Migration[5.2]
  def change
    add_reference :fines, :fine_point, foreign_key: true
  end
end
