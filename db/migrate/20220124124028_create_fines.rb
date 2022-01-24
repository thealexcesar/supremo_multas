class CreateFines < ActiveRecord::Migration[5.2]
  def change
    create_table :fines do |t|
      t.references :user, foreign_key: true
      t.datetime :fine_date
      t.integer :fine_status
      t.string :fine_number
      t.integer :branch_id

      t.timestamps
    end
  end
end
