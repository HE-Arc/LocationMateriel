class Tenant < ActiveRecord::Base
  belongs_to :product, class_name: "Product"
end
