json.array!(@tenants) do |tenant|
  json.extract! tenant, :id, :lastname, :firstname, :address, :npa, :email, :date_start, :date_end, :utilisation
  json.start tenant.date_start
  json.end tenant.date_end
  json.url tenant_url(tenant, format: :json)
end
