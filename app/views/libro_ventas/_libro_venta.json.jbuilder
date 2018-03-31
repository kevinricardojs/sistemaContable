json.extract! libro_venta, :id, :establecimiento_id, :mes, :year, :created_at, :updated_at
json.url libro_venta_url(libro_venta, format: :json)
