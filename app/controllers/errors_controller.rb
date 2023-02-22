# frozen_string_literal: true

class ErrorsController < ApplicationController
  skip_before_action :authorize_request
  def not_found
    render json: { error: 'Page not found' }, status: 404
  end
end
