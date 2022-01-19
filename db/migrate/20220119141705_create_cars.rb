class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.integer :year
      t.string :license_plate
      t.integer :status
      t.references :car_model, foreign_key: true

      t.timestamps
    end
  end
end
