Rails.application.config.to_prepare do
  Logster.store.level = Logger::INFO
  Logster.config.application_version = Rails.application.class.module_parent_name
end
