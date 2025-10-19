Rails.application.configure do
  # Configure lograge
  config.lograge.enabled = true
  config.lograge.formatter = Lograge::Formatters::Json.new
end
