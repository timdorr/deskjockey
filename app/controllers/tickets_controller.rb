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
            name: "Tim Dorr",
            email: "tim.dorr@salesloft.com"
        }
    }
  end

  def ticket
    $zendesk.tickets.create(ticket_fields)
  end
end
