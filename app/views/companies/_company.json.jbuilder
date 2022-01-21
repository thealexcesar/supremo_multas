json.extract! company, :id, :name, :company_type, :cnpj, :phone, :address, :number, :zipcode, :district, :city_id, :created_at, :updated_at
json.url company_url(company, format: :json)
