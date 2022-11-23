class BookingsController < ApplicationController
  before_action :set_chef, only: [:new, :create]
  before_action :set_user, only: [:new, :create, :destroy]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.chef = @chef
    @booking.user = @user
      if @booking.save!
        redirect_to user_path(@user)
      else
        render :new, status: :unprocessable_entity
      end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to user_path(current_user), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:description)
  end

  def set_chef
    @chef = Chef.find(params[:chef_id])
  end

  def set_user
    @user = current_user
  end
end
