class AddCompanyToModels < ActiveRecord::Migration[5.2]
  def change
    add_reference :cars, :company, foreign_key: true
    add_reference :car_brands, :company, foreign_key: true
    add_reference :car_models, :company, foreign_key: true
    add_reference :car_types, :company, foreign_key: true
    add_reference :fines, :company, foreign_key: true
    add_reference :fine_points, :company, foreign_key: true
    add_reference :users, :company, foreign_key: true
  end
end
