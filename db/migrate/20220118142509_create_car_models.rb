class CreateCarModels < ActiveRecord::Migration[5.2]
  def change
    create_table :car_models do |t|
      t.string :name
      t.references :car_brand, foreign_key: true
      t.references :car_type, foreign_key: true

      t.timestamps
    end
  end
end
