class CreateProcessedPayments < ActiveRecord::Migration[7.0]
  def change
    create_table :processed_payments do |t|
      t.string :token
      t.string :issuer_id
      t.string :payment_method_id
      t.string :transaction_amount
      t.string :installments
      t.text   :description
      t.string :email
      t.string :amount
      t.string :identification_type
      t.string :identification_number

      t.timestamps
    end
  end
end
