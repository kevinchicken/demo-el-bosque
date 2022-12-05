# Login contains a method to sign in a user from the mobile app.
class Api::LoginController < Api::BaseController
  skip_before_action :verify_authenticity_token
  def auth_api
    return 'There is no account with the email provided.' unless User.find_by_email(params[:email])

    user = User.find_by_email(params[:email])
    return 'Invalid password.' unless user.valid_password?(params[:password])

    user.set_auth_token
    render json: { success: true,
                   token: user[:token],
                   id: user[:id] }.to_json
  end
end
