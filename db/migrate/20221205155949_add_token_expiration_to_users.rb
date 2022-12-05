class AddTokenExpirationToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :token_expiry, :time, default: nil
  end
end
