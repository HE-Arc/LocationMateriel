class ProductMailer < ApplicationMailer
  def new_question_email(question, product)
    @question = question
    @product = product

    mail to: "leonardo.distasio@he-arc.ch", subject: 'Question d un utilisateur'
  end

  def tenant_proposed_location(tenant, product)
    @tenant = tenant
    @product = product

    mail to: "leonardo.distasio@he-arc.ch", subject: 'Demande de location'
  end

  def location_product_status(product)

  end
end
