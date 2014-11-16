class TicketsController < ApplicationController
  def new
  end

  def create
    @ticket = ticket
  end

  private

  def ticket_fields
    {
        comment: {
            body: params[:body]
        },
        requester: {
            locale_id: 1,
            name: session[:name],
            email: session[:email]
        }
    }
  end

  def ticket
    $zendesk.tickets.create(ticket_fields)
  end
end
