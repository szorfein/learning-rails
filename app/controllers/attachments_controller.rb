class AttachmentsController < ApplicationController
  def show 
    ticket = Ticket.find(params[:id])
    authorize ticket, :show?
    send_file ticket.attachment.path, disposition: :inline
  end
end
