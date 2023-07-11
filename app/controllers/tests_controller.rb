class TestsController < ApplicationController
  def index
    @messages = Message.all
    #render json: { message: "hello" }
    render template: "messages/index"
  end
end
