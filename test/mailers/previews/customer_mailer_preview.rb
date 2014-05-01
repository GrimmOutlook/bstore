# Preview all emails at http://localhost:3000/rails/mailers/customer_mailer
class CustomerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/customer_mailer/verify
  def verify
    CustomerMailer.verify(Customer.last)
  end

end
