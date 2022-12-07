# frozen_string_literal: true

# Users controller has methods regarding users that access the page via mobile app
class Api::UsersController < Api::BaseController
  before_action :after_login

  def profile
    user = User.find(request.headers['Id'])
    render json: { success: true,
                   email: user.email,
                   image: url_for(user.image),
                   full_name: user.full_name }
  end
end
