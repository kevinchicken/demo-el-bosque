class Api::LoginController < Api::BaseController
  def auth_api(email, password)
    return 'There is no account with the email provided.' unless User.find_by_email(email)

    user = User.find_by_email(email)
    return 'Invalid password.' unless user.valid_password?(password)

    user.set_auth_token
    { success: true,
      token: user[:token],
      id: user[:id] }.to_json
  end
end

# chequear email y pass, 2. generar token, 3. guardar token en el usuario (generar una nueva columna en la tabla)
