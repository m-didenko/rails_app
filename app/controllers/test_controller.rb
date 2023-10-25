class TestController < ApplicationController

  def ping
    render json: { message: 'ok' }
  end
end