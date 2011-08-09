RailsAdmin.config do |config|
  config.included_models = ["User", "Micropost", "Relationship", "Delayed::Job"]
end
