class Buildkite::Build < Buildkite::Resource

  def initialize(project_slug, data_or_id)
    @project_slug = project_slug

    if data_or_id.is_a?(String)
      @slug = data_or_id
    else
      @data = data_or_id.with_indifferent_access
    end
  end

  def path
    "organizations/#{ENV['BUILDKITE_ORG_NAME']}/projects/#{@project_slug}/builds/#{slug}"
  end

  def to_s
    self[:message]
  end

end