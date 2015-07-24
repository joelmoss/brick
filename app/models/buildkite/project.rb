class Buildkite::Project < Buildkite::Resource

  def initialize(data_or_slug)
    if data_or_slug.is_a?(String)
      @slug = data_or_slug
    else
      @data = data_or_slug.with_indifferent_access
    end
  end

  def builds(*args)
    options = args.extract_options!
    Buildkite::Builds.new(slug, options)
  end

  def path
    "organizations/#{ENV['BUILDKITE_ORG_NAME']}/projects/#{slug}"
  end

  def github_path
    @github_path ||= begin
      if matched = self[:repository].match(/github.com[:\/]([\w\-]+\/[\w\-]+)/i)
        matched[1]
      else
        raise "#{self[:repository]} is not a Github repository."
      end
    end
  end

  def github_url
    "https://githun.com/#{github_path}"
  end

end