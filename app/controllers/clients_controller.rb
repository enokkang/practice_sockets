class ClientsController < ApplicationController
  def index
    @clients = Client.all
    render :index
  end

  def new
    @client = Client.new
    render :new
  end

  def show
    @client = Client.find_by(id: params[:id])
    render :show
  end

  def create
    @client = Client.new(
      ip: params[:client][:ip],
    )
    if @client.save
      #render :show
      redirect_to root_path, notice: "Client created successfully."
    else
      render json: @client.errors.full_messages, status: 422
    end
  end

  def edit
    @client = Client.find_by(id: params[:id])
    render :edit
  end

  def update
    @client = Client.find_by(id: params[:id])
    if @client.update(

      ip: params[:client][:ip],

    )
      render :show
    else
      render json: @client.errors.full_messages, status: 422
    end
  end

  def destroy
    @clients = Client.all
    @clients.all.map(&:destroy)
    redirect_to root_path
  end

  # def receive
  #   @client = Client.find_by(id: params[:id])
  #   render :show
  # end

  # def send
  #   @client = Client.find_by(id: params[:id])
  #   render :show
  # end
end
