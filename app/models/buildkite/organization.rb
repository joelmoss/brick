class Buildkite::Organization < Buildkite::Resource

  attr_reader :org_name


  def initialize
    @org_name = ENV['BUILDKITE_ORG_NAME']
  end

  def path
    "organizations/#{org_name}"
  end

  def projects
    Buildkite.projects
  end

end