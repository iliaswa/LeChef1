class ChefsController < ApplicationController
  before_action :set_chef, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :create]

  def index
    @chefs = Chef.all

    if params[:query].present?
      sql_query = <<~SQL
        chefs.cuisine @@ :query
        OR chefs.details @@ :query

      SQL
      @chefs = Chef.joins(:first_name).where(sql_query, query: "%#{params[:query]}%")
    else
      @chefs = Chef.all
    end
  end

  def show
  end

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(strong_params)
    @chef.user = @user
    @chef.save! # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to chef_path(@chef)
  end

  def destroy
    @chef.destroy!
    redirect_to chefs_path, status: :see_other
  end

  private

  def set_user
    @user = current_user
  end

  def set_chef
    @chef = Chef.find(params[:id])
  end

  def strong_params
    params.require(:chef).permit(:details, :cuisine, :availability)
  end
end
