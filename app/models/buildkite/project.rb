class Buildkite::Project < Buildkite::Resource

  def initialize(data_or_slug)
    if data_or_slug.is_a?(String)
      @slug = data_or_slug
    else
      @data = data_or_slug.with_indifferent_access
    end
  end

  def path
    "organizations/#{ENV['BUILDKITE_ORG_NAME']}/projects/#{slug}"
  end

end