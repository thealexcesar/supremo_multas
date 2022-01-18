json.extract! car_model, :id, :name, :car_brand_id, :car_type_id, :created_at, :updated_at
json.url car_model_url(car_model, format: :json)
