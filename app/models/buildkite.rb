class Buildkite

  class Client

    PROTOCOL = 'https'
    HOSTNAME = 'api.buildkite.com'
    VERSION  = 'v1'


    def get(path, params={})
      connection.get path, params
    end


    private

      def connection
        @connection ||= Faraday.new(url) do |faraday|
          faraday.request :instrumentation
          faraday.request :authorization, 'Bearer', ENV['BUILDKITE_TOKEN']
          faraday.request :json

          faraday.response :raise_error
          faraday.response :json
          # faraday.response :logger if Rails.env.development?

          faraday.adapter Faraday.default_adapter
        end
      end

      def url
        "#{PROTOCOL}://#{HOSTNAME}/#{VERSION}"
      end

  end


  def self.organization
    Organization.new
  end

  def self.projects
    Projects.new
  end

end