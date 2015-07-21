class ProjectsController < ApplicationController


  def show

  end


  private

    def current_project
      @current_project ||= Buildkite::Project.new(params[:id])
    end

end
