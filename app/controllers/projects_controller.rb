class ProjectsController < ApplicationController

  def index
  end

  def new
    @project = Project.new
  end

  # POST request
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project has been created.' }
      else
        format.html { render :new }
        flash.now[:alert] = "Project has not been created."
      end
    end
  end

  def show 
    @project = Project.find(params[:id])
  end

end

private

def project_params
  params.require(:project).permit(:name, :description)
end
