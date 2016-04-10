class Product < ActiveRecord::Base
  has_many :questions, class_name: "Question"
  has_one :tenants, class_name: "Tenant"

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :price
  validates_presence_of :renter
  validates_presence_of :date_start
  validates_presence_of :date_end

  has_attached_file :image,
                    styles: {medium: '250x250', thumb: '125x125'},
                    default_url: ':style/default.png'

  validates_attachment_content_type :image, content_type: /^image\/.*$/




#  def self.search(title, description, price)
#    if title.present?
#
#       paginate :conditions => ['title LIKE ? AND description LIKE ? AND price ?', "%#{title}%", "%#{description}%", title],  #                      :per_page => 20,
#                     :order => 'created_at DESC',
#                    :page => @page,
#                   :total_entries => 10

#    else
#   paginate :conditions => ['title LIKE ? AND description LIKE ?', "%#{title}%", "%#{description}%"],
#                  :per_page => 20,
#                 :order => 'created_at DESC',
#                :page => @page,
#               :total_entries => 10                
# end
#end
end
