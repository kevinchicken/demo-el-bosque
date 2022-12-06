# AfterLogin contains a method to check request after signing in a user from the mobile app.
class Api::AfterloginController < Api::BaseController
  before_action :after_login

  def profile
    user = User.find(request.headers['Id'])
    render json: { success: true,
                   email: user.email,
                   image: 'Soy una imagen de gatitos',
                   full_name: 'Soy un nombre completo' }
  end

  def logout
    user = User.find(request.headers['Id'])
    user.token, user.token_expiry = nil
    user.save
    render json: { success: true, message: 'La sesión ha finalizado.' }
  end
end
