class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :signed_in?
  helper_method :current_org

  add_breadcrumb 'Dashboard', :root_path


  private

    def current_user
      begin
        @current_user ||= CurrentUser.new(session[:github_auth] || {})
      rescue
        nil
      end
    end

    def signed_in?
      current_user.signed_in?
    end

    def authenticate_user!
      if !signed_in?
        redirect_to root_url, alert: 'You need to sign in for access to this page.'
      end
    end

    def current_org
      @current_org ||= Buildkite.organization
    end

end
