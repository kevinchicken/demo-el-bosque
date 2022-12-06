# Login contains a method to sign in a user from the mobile app.
class Api::LoginController < Api::BaseController
  def auth_api
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
end
