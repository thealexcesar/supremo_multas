class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :company_type
      t.string :cnpj
      t.string :phone
      t.string :address
      t.string :number
      t.string :zipcode
      t.string :district
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
