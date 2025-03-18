Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'http://localhost:5173' # Cambia esto si tu frontend está en otro dominio
  
      resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options],
        credentials: true
    end
  end
  