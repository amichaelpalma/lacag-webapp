class PagesController < ApplicationController

  def home
    # Users
    @users = User.all
    # Donations
    @donations = Donation.with_attached_item_photo
  end

  def about
  end

  def seminarsandtrainings
  end


end