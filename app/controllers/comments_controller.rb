class CommentsController < ApplicationController
  before_action :set_ticket

  def create 
    @comment = @ticket.comments.build(comment_params)
    @comment.author = current_user
    authorize @comment, :create?

    respond_to do |format|
      if @comment.save
        format.html { redirect_to [@ticket.project, @ticket], notice: 'Comment has been created.' }
      else
        flash.now[:alert] = 'Comment has not been created.'
        @project = @ticket.project
        format.html { render "tickets/show" }
      end
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
