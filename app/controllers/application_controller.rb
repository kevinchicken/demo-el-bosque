class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include ActiveStorage::SetCurrent

  def after_sign_in_path_for(_)
    landing_index_url
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name,
                                                              :image])
  end
end
