class TicketsController < ApplicationController
  def new
  end

  def create
    @ticket = ticket
  end

  private

  def ticket_fields
    {
        subject: params[:subject],
        comment: {
            body: params[:body]
        },
        requester: {
            locale_id: 1,
            name: session[:name],
            email: session[:email]
        },
        custom_fields: ticket_custom_fields
    }
  end

  def ticket_custom_fields
    session[:fields].map{ |id, value| {id: id.to_i, value: value} }
  end

  def ticket
    $zendesk.tickets.create(ticket_fields)
  end
end
