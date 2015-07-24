Octokit.middleware = Faraday::RackBuilder.new do |builder|
  # builder.response :logger if Rails.env.development?
  builder.request :instrumentation
  builder.use Octokit::Response::RaiseError
  builder.adapter Faraday.default_adapter
end