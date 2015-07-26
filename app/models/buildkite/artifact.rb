class Buildkite::Artifact < Buildkite::Resource

  def initialize(project_slug, build_number)
    @project_slug = project_slug
    @build_number = build_number
  end

  def path
    "organizations/#{ENV['BUILDKITE_ORG_NAME']}/projects/#{@project_slug}/builds/#{@build_number}/artifacts"
  end

  def to_s
    self[:filename]
  end

  def data
    @data ||= (response.body.first.try(:with_indifferent_access) || nil)
  end

  def nil?
    @data.nil?
  end

end