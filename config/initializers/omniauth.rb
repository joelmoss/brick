Rails.application.config.middleware.use OmniAuth::Builder do
  params = ENV['GITHUB_REDIRECT_URI'] ? { redirect_uri: ENV['GITHUB_REDIRECT_URI'] } : {}
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: 'repo', authorize_params: params
end