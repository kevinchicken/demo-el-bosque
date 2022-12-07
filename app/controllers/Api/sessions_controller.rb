# frozen_string_literal: true

# Sessions controller containg mobile login and logout methods
class Api::SessionsController < Api::BaseController
  def login
    error_email = { success: false,
                    message: 'There is no account with the email provided.' }
    error_password = { success: false,
                       message: 'Invalid password.' }
    user = User.find_by_email(params[:email])
    return render json: error_email unless user

    return render json: error_password unless user.valid_password?(params[:password])

    user.set_auth_token
    render json: { success: true, token: user[:token], id: user[:id] }
  end

  def logout
    after_login
    user = User.find(request.headers['Id'])
    user.token, user.token_expiry = nil
    user.save
    render json: { success: true, message: 'La sesión ha finalizado.' }
  end
end
