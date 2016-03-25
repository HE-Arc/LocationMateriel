class Tenant < ActiveRecord::Base
  belongs_to :product, class_name: "Product"

  validates :lastname, presence: { message: "Insérer un nom de famille" }
  validates :firstname, presence: { message: "Insérer un prénom" }
  validates :address, presence: { message: "Insérer une adresse" }
  validates :city, presence: { message: "Insérer une ville" }
  validates :npa, format: { with: /\A[0-9]{4}$\z/, on: :create, message: "Insérer un NPA correct" }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, message: "Insérer un e-mail correct" }
  validates :date_start, presence: { message: "Insérer une date de début" }
  validates :date_end, presence: { message: "Insérer une date de fin" }
  validates :utilisation, presence: { message: "Indiquer l'utilisation" }
  validate :date_start_sup_end
  validate :date_must_not_be_tenant
  validate :already_rented

  def date_start_sup_end
    if self.date_start > self.date_end
      errors.add(:date_start, "La date de début doit être avant la date de fin")
    end
  end

  def date_must_not_be_tenant
    product = Product.find(product_id)
    if self.date_start < product.date_start or self.date_end > product.date_end 
      errors.add(:date_start_end, "La location est entre le #{product.date_start} et le #{product.date_end}")
    end
  end

  def already_rented
    product = Product.find(product_id)
    tenantsExitIds = Tenant.where(product: product)
    tenantExisting = Tenant.where(id: tenantsExitIds)

    datesRequire = []
    datesExisting = []

    ((self.date_start)..self.date_end).each {|d| datesRequire << d }

    tenantExisting.each do |te|
      datesRequire.each do |date|
        if date >= te.date_start and date <= te.date_end
          datesExisting << date
        end
      end
    end

    if datesExisting.count > 0
      msg = "Les dates suivantes sont déjà prises : "
      datesExisting.each_with_index do |d, i|
        msg = msg + d.to_s
        if i != (datesExisting.count - 1)
          msg = msg + ', '
        end
      end
      errors.add(:date_error, msg)
    end
  end

end
