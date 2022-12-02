class ApplicationController < ActionController::Base
  def after_sign_in_path_for(_)
    landing_index_url
  end
end
