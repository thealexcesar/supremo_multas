class AddDetranToFine < ActiveRecord::Migration[5.2]
  def change
    add_column :fines, :detran_id, :integer
  end
end
