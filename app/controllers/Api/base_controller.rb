# frozen_string_literal: true

# Base controller contains the method that checks if the user has a valid token
class Api::BaseController < ApplicationController
  skip_before_action :verify_authenticity_token

  private

  def after_login
    id = request.headers['Id']
    token = request.headers['Authorization']
    user = User.find(id)
    return if user.valid_token?(token)

    render json: { success: false, message: 'Debes iniciar sesión para ver esta sección' }
  end
end
