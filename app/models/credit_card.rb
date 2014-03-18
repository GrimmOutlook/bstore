class CreditCard < ActiveRecord::Base
  belongs_to :customer

  # def expiry=(expiry)
  # end
end
