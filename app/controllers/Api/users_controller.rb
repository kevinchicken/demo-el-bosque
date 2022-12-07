# frozen_string_literal: true

# Users controller has methods regarding users that access the page via mobile app
class Api::UsersController < Api::BaseController
  before_action :after_login

  def profile
    user = User.find(request.headers['Id'])
    render json: { success: true,
                   email: user.email,
                   image: 'Soy una imagen de gatitos',
                   full_name: 'Soy un nombre completo' }
  end
end
