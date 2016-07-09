Apartment.configure do |config|
  config.excluded_models = ['Account', 'User']
  config.tenant_names = -> { Account.pluck(:subdomain) }
end
