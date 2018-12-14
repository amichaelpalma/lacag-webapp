class VolunteersController < ApplicationController

  before_action :set_volunteer, only: [:edit, :update, :show, :destroy]

  def index
    @volunteers = Volunteer.all
  end

  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.new(volunteer_params)
    if @volunteer.save
      flash[:success] = 'You have successfully signed up to volunteer. Please wait for our call to confirm your availabilty.
                        We appreciate your efforts.'
      redirect_to volunteer_path(@volunteer)
    else
      render 'new'
    end
  end

  def show
    @volunteer = Volunteer.find(params[:id])
  end

  def edit
    @volunteer = Volunteer.find(params[:id])
  end

  def update
    @volunteer = Volunteer.find(params[:id])
    if @volunteer.update(volunteer_params)
      flash[:notice] = 'Volunteer details successfully updated.'
      redirect_to volunteer_path(@volunteer)
    else
      render 'edit'
    end
  end

  def destroy
    @volunteer.destroy
    flash[:notice] = 'Volunteer removed from database.'
    redirect_to volunteer_path
  end









  private

    def volunteer_params
      params.require(:volunteer).permit(:first_name, :last_name, :email, :cp_number, :alt_cp_number, :location)
    end

    def set_volunteer
      @volunteer = Volunteer.find(params[:id])
    end

end