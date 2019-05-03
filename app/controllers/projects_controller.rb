class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]

  def index
  end

  def new
    @project = Project.new
    @categories = Category.all
  end

  # POST request
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project has been created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show 
  end

end

private

def set_project
  @project = Project.find(params[:id])
end

def project_params
  params.require(:project).permit(:name, :description, :category_id)
end
