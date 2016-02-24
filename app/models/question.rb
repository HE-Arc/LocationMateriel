class Question < ActiveRecord::Base
  belongs_to :product, class_name: "Product"

  validates :title, presence: { message: "Insérer un titre" }, length: { maximum: 30, too_long: "Titre trop long (max 30 caract.)" }
  validates :asker, presence: { message: "Insérer un pseudo" }, length: { maximum: 20, too_long: "Pseudo trop long (max 20 caract.)" }
  validates :question, presence: { message: "Insérer une question" }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, message: "Insérer un e-mail correct" }
end
