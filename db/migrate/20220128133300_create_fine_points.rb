class CreateFinePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :fine_points do |t|
      t.string :name
      t.integer :point

      t.timestamps
    end
  end
end
