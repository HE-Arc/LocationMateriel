class Product < ActiveRecord::Base
  has_many :questions, class_name: "Question"

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :price
  validates_presence_of :renter
  validates_presence_of :date_start
  validates_presence_of :date_end

  has_attached_file :image,
                    styles: {medium: '250x250', thumb: '125x125'},
                    default_url: 'default.png'

  validates_attachment_content_type :image, content_type: /^image\/.*$/
end
