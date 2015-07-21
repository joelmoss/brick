class SessionsController < ApplicationController

  def create
    reset_session
    auth = request.env["omniauth.auth"]

    # Check that this user is a member of the Github organization.
    client = Octokit::Client.new access_token: auth['credentials']['token']
    unless client.org_member?(org_name, client.user.login)
      redirect_to root_url, alert: "Authentication error: you are not a member of the #{org_name}."
    end

    session[:github_auth] = {
      username: client.user.login,
      uid: auth['uid'],
      token: auth['credentials']['token']
    }
    redirect_to root_url, notice: 'Signed in!'
  end

  def destroy
    reset_session
    redirect_to root_url, notice: 'Signed out!'
  end

  def failure
    redirect_to root_url, alert: "Authentication error: #{params[:message].humanize}"
  end


  private

    def org_name
      ENV['GITHUB_ORG_NAME']
    end

end