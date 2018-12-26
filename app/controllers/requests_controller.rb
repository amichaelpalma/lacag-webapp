class RequestsController < ApplicationController

  before_action :authorize, only: [:edit, :show]


  def index
    @requests = Request.all
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      flash[:success] = 'Thank you for signing up. Please wait for our email list for available dates.'
      redirect_to root_path
    else
      render 'new'
    end
  end


  def edit
    @request = Request.find(params[:id])
  end

  def update
    @request = Request.find(params[:id])
    if @request.update(request_params)
      flash[:success] = 'Request updated.'
      redirect_to requests_path
    else
      render 'edit'
    end
  end

  def show
    @request = Request.find(params[:id])
  end


  private

  def request_params
    params.require(:request).permit(:first_name, :last_name, :email, :cp_number, :location, :sent)
  end

end