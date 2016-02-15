class Product < ActiveRecord::Base
	validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :price
  validates_presence_of :renter
  validates_presence_of :date_start
  validates_presence_of :date_end
end
