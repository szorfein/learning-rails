class TicketsController < ApplicationController
  # We need set_project to find the project_id value before set_ticket
  before_action :set_project
  before_action :set_ticket, only: [ :show, :edit, :update, :destroy ]

  def new
    @ticket = @project.tickets.build
  end
  
  def create
    @ticket = @project.tickets.build(ticket_params)
    @ticket.author = current_user

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to [@project, @ticket], notice: 'Ticket has been created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    authorize @ticket, :show?
  end

  def edit
  end

  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to [@project, @ticket], notice: 'Ticket has been updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to @project, notice: 'Ticket has been deleted.' }
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_ticket
    @ticket = @project.tickets.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :description)
  end
end

