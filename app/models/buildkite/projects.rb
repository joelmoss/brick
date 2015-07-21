class Buildkite::Projects < Buildkite::Resources

  def each
    response.body.each { |project| yield Buildkite::Project.new(project) }
  end

  def path
    "organizations/#{ENV['BUILDKITE_ORG_NAME']}/projects"
  end

end