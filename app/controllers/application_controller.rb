class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to after_access_denied, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def after_access_denied
    if user_signed_in?
      static_access_denied_url
    else
      new_user_session_url
    end
  end
end
