class ProjectsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        flash[:notice] = 'Project was successfully created.'
        redirect_to @project
      else
        # nothing, yet
      end
    end
  end
end
