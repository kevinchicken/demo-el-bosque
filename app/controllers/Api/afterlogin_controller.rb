# AfterLogin contains a method to check request after signing in a user from the mobile app.
class Api::AfterloginController < Api::BaseController
  before_action :after_login

  def news
    render json: { success: true }
  end

  def profile
    user = User.find(params[:id])
    render json: { success: true,
                   email: user.email,
                   image: 'Soy una imagen de gatitos',
                   full_name: 'Soy un nombre completo' }
  end

  def logout
    user = User.find(params[:id])
    user.token, user.token_expiry = nil
    user.save
    render json: { success: true, message: 'La sesión ha finalizado.' }
  end

  private

  def after_login
    id = params[:id]
    token = request.headers['Authorization']
    user = User.find(id)
    return if user.valid_token?(token)

    render json: { success: false, message: 'Debes iniciar sesión para ver esta sección' }
  end
end
