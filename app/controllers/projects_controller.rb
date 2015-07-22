class ProjectsController < ApplicationController

  def show
    @project = Buildkite::Project.new(params[:id])
  rescue Faraday::ResourceNotFound
    redirect_to :root
  end

end
