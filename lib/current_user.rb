class CurrentUser
  def initialize(data = {})
    @data = data
  end

  def signed_in?
    @data['uid'] && @data['token']
  end

  def to_s
    @data['username']
  end
end
