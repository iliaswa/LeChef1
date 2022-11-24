class ChefsController < ApplicationController
  before_action :set_chef, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :create]

  def index
    if params[:query].present?
      sql_query = <<~SQL
      chefs.cuisine @@ :query
      OR chefs.details @@ :query
      SQL
      @chefs = Chef.joins(:first_name).where(sql_query, query: "%#{params[:query]}%")
      @images = ["https://playswellwithbutter.com/wp-content/uploads/2020/12/Individual-Beef-Wellington-27.jpg","https://francemotorhomehire.com/wp-content/uploads/2017/12/gourmet-food.jpg", "https://media.timeout.com/images/105604990/750/422/image.jpg", "https://media.timeout.com/images/105544382/750/422/image.jpg", "https://i0.wp.com/beastmag.co.uk/wp-content/uploads/2020/02/Indian-food--scaled.jpg?resize=2000%2C1200&ssl=1", "https://www.visitbuckinghamshire.org/cache/public/article-images-1510659824-a056cf650d824b3a4ec02528ec31f762-CROP-600x450.jpg"]
    else
      @chefs = Chef.all
      @images = ["https://playswellwithbutter.com/wp-content/uploads/2020/12/Individual-Beef-Wellington-27.jpg","https://francemotorhomehire.com/wp-content/uploads/2017/12/gourmet-food.jpg", "https://media.timeout.com/images/105604990/750/422/image.jpg", "https://media.timeout.com/images/105544382/750/422/image.jpg", "https://i0.wp.com/beastmag.co.uk/wp-content/uploads/2020/02/Indian-food--scaled.jpg?resize=2000%2C1200&ssl=1", "https://www.visitbuckinghamshire.org/cache/public/article-images-1510659824-a056cf650d824b3a4ec02528ec31f762-CROP-600x450.jpg"]
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
