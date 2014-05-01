class VerifiedAtToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :verified_at, :datetime
  end
end
