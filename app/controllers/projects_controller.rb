class ProjectsController < ApplicationController

  def show
    @project = Buildkite::Project.new(params[:id])
    @pulls = github.pull_requests(@project.github_path, base: 'master')
    branches = @pulls.map { |pull| pull[:head][:ref] } << 'master'
    @builds = @project.builds(state: 'passed', branch: branches)
                      .sort_by { |b| b[:branch] }
                      .group_by { |b| b[:branch] }
  rescue Faraday::ResourceNotFound
    redirect_to :root
  end

end
