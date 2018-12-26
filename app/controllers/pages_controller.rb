class PagesController < ApplicationController

  def home
    # Users
    @users = User.all
    # Donations
    @donations = Donation.with_attached_item_photo
    # Events
    @events = Event.with_attached_event_images
  end

  def about
  end

  def seminarsandtrainings
  end

  def secret
  end

  def donate
  end


end