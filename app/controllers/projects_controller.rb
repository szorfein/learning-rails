class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update]

  def index
    @projects = policy_scope(Project)
  end

  def show 
    authorize @project, :show?
  end

  def edit
    authorize @project, :update?
  end

  def update
    authorize @project, :update?
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project has been updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The project you were looking for could not be found."
    redirect_to projects_path
  end

  def project_params
    params.require(:project).permit(:name, :description, :category_id)
  end

end

