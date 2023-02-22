class ErrorsController < ApplicationController

  def not_found
    render json: {error: 'Page not found'}, status: 404
  end
end