class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.belongs_to :customer, index: true
      t.string :cc_number
      t.string :exp_month
      t.string :exp_year

      t.timestamps
    end
  end
end
