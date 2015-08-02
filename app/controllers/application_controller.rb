class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :load_iframe_options
  after_action :allow_iframe

  private

  def load_iframe_options
    session[:name] = params[:name] if params[:name].present?
    session[:email] = params[:email] if params[:email].present?
    session[:fields] = params[:fields] if params[:fields].present?
    session[:tags] = params[:tags].split(',') if params[:tags].present?

    if session[:name].blank? || session[:email].blank?
      response.headers.except! 'X-Frame-Options'
      render text: "You must specify a name and email", status: :unprocessable_entity
    end
  end

  def allow_iframe
    response.headers.except! 'X-Frame-Options'
  end
end
