class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource_or_scope)
    landing_index_url
  end

  def after_sign_up_path_for(resource_or_scope)
    after_sign_in_path_for(resource_or_scope)
  end
end
