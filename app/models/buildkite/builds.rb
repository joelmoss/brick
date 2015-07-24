class Buildkite::Builds < Buildkite::Resources
  attr_reader :project_slug


  def initialize(project_slug=nil, options)
    @options = options
    @project_slug = project_slug
  end

  def each
    response.body.each { |build| yield Buildkite::Build.new(project_slug, build) }
  end

  def params
    @options
  end

  def path
    if project_slug
      "organizations/#{ENV['BUILDKITE_ORG_NAME']}/projects/#{project_slug}/builds"
    else
      "organizations/#{ENV['BUILDKITE_ORG_NAME']}/builds"
    end
  end

end