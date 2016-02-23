json.array!(@tenants) do |tenant|
  json.extract! tenant, :id, :lastname, :firstname, :adress, :npa, :email, :date_start, :date_end, :utilisation
  json.url tenant_url(tenant, format: :json)
end
