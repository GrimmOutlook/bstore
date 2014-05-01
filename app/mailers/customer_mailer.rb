class CustomerMailer < ActionMailer::Base
  default from: "emailguru@shrouded-wave-5627.herokuapp.com/"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.customer_mailer.verify.subject
  #

  #The verify customer method.  Use first part of: http://api.rubyonrails.org/classes/Rails/Application.html#method-i-message_verifier
  def verify(customer)
    @customer = customer

    @token = Rails.application.message_verifier('customer').generate('@customer.id')

    mail to: @customer.email
  end
end
