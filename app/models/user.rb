class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def set_auth_token
    self.token = SecureRandom.base58(36)
    self.token_expiry = Time.now + 1.day
    save
  end

  def valid_token?(id, token)
    user = User.find(id)
    return if user[:token] == token && user[:token_expiry] > Time.now
  end
end
