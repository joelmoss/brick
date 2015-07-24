class Buildkite::Resources
  include Enumerable


  def each
    response.body.each { |item| yield item }
  end


  private

    def response
      @response ||= client.get(path, params)
    end

    def path
      ''
    end

    def params
      {}
    end

    def client
      @client ||= Buildkite::Client.new
    end

end