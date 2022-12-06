# AfterLogin contains a method to check request after signing in a user from the mobile app.
class Api::AfterloginController < Api::BaseController
  before_action :after_login

  def news
    render json: { success: true }
  end

  def profile
  end

  def logout
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
