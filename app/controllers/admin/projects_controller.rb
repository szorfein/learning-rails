class Admin::ProjectsController < Admin::ApplicationController

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

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project has been deleted.' }
    end
  end

  private 

  def project_params
    params.require(:project).permit(:name, :description, :category_id)
  end

end
