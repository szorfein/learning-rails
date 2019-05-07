class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update]

  def index
    @projects = Project.all
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

  def edit
    @project = Project.find(params[:id])
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project has been updated.' }
      else
        format.html { render :edit }
      end
    end
  end
end

private

def set_project
  @project = Project.find(params[:id])
end

def project_params
  params.require(:project).permit(:name, :description, :category_id)
end
