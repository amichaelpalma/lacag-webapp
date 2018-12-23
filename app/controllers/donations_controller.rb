class DonationsController < ApplicationController

  before_action :authorize, only: [:new, :update, :delete, :edit]


  before_action :set_donation, only: [:edit, :update, :show, :destroy]

  def index
    @donations = Donation.with_attached_item_photo
  end

  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donation_params)

    if @donation.save
      flash[:success] = "A donation item was added to the list."
      redirect_to donations_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @donation.update(donation_params)
      flash[:notice] = "Item successfully updated."
      redirect_to donation_path(@donation)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @donation.destroy
    flash[:notice] = "Donation item was successfully deleted."
    redirect_to donations_path
  end


  private

  def donation_params
    params.require(:donation).permit(:item_name, :item_photo, :item_description)
  end

  def set_donation
    @donation = Donation.find(params[:id])
  end

end