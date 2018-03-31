json.extract! venta, :id, :documento, :serie, :numero, :dia, :nit, :nombre, :bienes, :servicios, :base, :iva, :total, :created_at, :updated_at
json.url venta_url(venta, format: :json)
