class AddCreatedByModels < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :created_by, :integer
    add_column :companies, :created_by, :integer
    add_column :car_brands, :created_by, :integer
    add_column :car_models, :created_by, :integer
    add_column :car_types, :created_by, :integer
    add_column :fines, :created_by, :integer
    add_column :fine_points, :created_by, :integer
    add_column :users, :created_by, :integer
  end
end
