json.extract! car, :id, :year, :license_plate, :status, :car_model_id, :created_at, :updated_at
json.url car_url(car, format: :json)
