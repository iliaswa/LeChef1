class ChefsController < ApplicationController
before_action :set_chef, only: [:show, :edit, :update, :destroy]

  def index
    @chefs = Chef.all
  end

  def show
  end

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(strong_params)
    @chef.save! # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to chef_path(@chef)
  end

  def destroy
    @chef.destroy!
    redirect_to chefs_path, status: :see_other
  end

  private

  def set_chef
    @chef = Chef.find(params[:id])
  end

  def strong_params
    params.require(:chef).permit(:details, :cuisine, :availability)
  end

end
