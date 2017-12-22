json.extract! product, :id, :description, :gst, :unit, :rate, :discount, :amount, :final_amount, :single_price_rate, :created_at, :updated_at
json.url product_url(product, format: :json)
