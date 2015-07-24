class Buildkite::Resource
  attr_reader :data, :slug

  def [](key)
    data[key]
  end

  def to_s
    self[:name]
  end

  def to_param
    self[:slug]
  end

  def data
    @data ||= response.body.with_indifferent_access
  end


  private

    def response
      @response ||= client.get(path)
    end

    def path
      ''
    end

    def client
      @client ||= Buildkite::Client.new
    end

end