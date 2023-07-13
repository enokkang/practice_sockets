class TestsController < ApplicationController
  def index
    @messages = Message.all
    #render json: { message: "hello" }
    render template: "messages/index"
  end

  def show
    @message = Message.find_by[params: ["id"]]
    render template: "messages/show"
  end
end
