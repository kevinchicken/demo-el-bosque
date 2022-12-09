class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  ROLES = %i[admin reader]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image

  def admin?
    role == 'admin'
  end

  def set_auth_token
    self.token = SecureRandom.base58(36)
    self.token_expiry = Time.now + 1.day
    save
  end

  def valid_token?(token)
    self.token == token && token_expiry > Time.now
  end
end
