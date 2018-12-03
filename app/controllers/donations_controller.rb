class DonationsController < ApplicationController

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


  private

  def donation_params
    params.require(:donation).permit(:item_name, :item_photo, :item_description)
  end

end