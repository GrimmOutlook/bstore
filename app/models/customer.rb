class Customer < ActiveRecord::Base
  after_create :send_welcome_email

  has_many :orders
  has_many :line_items, :through => :orders
  has_many :products, :through => :line_items
  has_many :credit_cards

  has_secure_password validations: false

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :zip_code, presence: true

  def self.verify(token)
    customer_id = Rails.application.message_verifier('customer').verify(token)
    customer = Customer.find(customer_id)
    customer.update!(verified_at: Time.current) unless customer.verified_at
    customer
  rescue
    nil
  end

  def send_welcome_email
    CustomerMailer.verify(self).deliver
  end

end
