Rails.application.routes.draw do
  mount Yabeda::Prometheus::Exporter, at: "/metrics"
  mount(
    Rack::Auth::Basic.new(Logster::Web) do |username, password|
      username == ENV.fetch('LOGSTER_USERNAME', 'admin') &&
        password == ENV.fetch('LOGSTER_PASSWORD', 'admin')
    end,
    at: "/logs"
  )
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  get "seed" => "hello#seed_everything"
  get "refresh_online" => "hello#refresh_online"

  # Defines the root path route ("/")
  root "hello#index"
end
