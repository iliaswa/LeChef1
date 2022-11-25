class ChefsController < ApplicationController
  before_action :set_chef, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :create]

  def index
    @chefs = Chef.all
    @images = ["https://playswellwithbutter.com/wp-content/uploads/2020/12/Individual-Beef-Wellington-27.jpg", "https://francemotorhomehire.com/wp-content/uploads/2017/12/gourmet-food.jpg", "https://media.timeout.com/images/105604990/750/422/image.jpg", "https://media.timeout.com/images/105544382/750/422/image.jpg", "https://i0.wp.com/beastmag.co.uk/wp-content/uploads/2020/02/Indian-food--scaled.jpg?resize=2000%2C1200&ssl=1", "https://www.visitbuckinghamshire.org/cache/public/article-images-1510659824-a056cf650d824b3a4ec02528ec31f762-CROP-600x450.jpg"]

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
    @gallery_1 = ["https://cdn.britannica.com/83/127183-050-89DFBDE2/Gordon-Ramsay-British-restaurateur.jpg", " https://cdn.thelondoneconomic.com/wp-content/uploads/2021/08/d6209be9-how-to-make-the-perfect-full-english-breakfast-fry-up-scaled.jpeg", "https://culinaryginger.com/wp-content/uploads/Roast-Beef-Dinner-Sunday-Roast-3-.jpg", " https://food-images.files.bbci.co.uk/food/recipes/shepherdspie_2077_16x9.jpg", "https://cdn-bmalj.nitrocdn.com/uirOOtSrYrqqUksKHkiSCjZGZlPeXsmk/assets/static/optimized/rev-939cb5a/images/Traditional-British-Food.jpg", "https://onlycrumbsremain.com/wp-content/uploads/2021/10/sticky-toffee-pudding-1200sq.jpg" ]
    @gallery_2 = ["https://www.greatbritishfoodawards.com/images/made/assets/images/judges/michel_540_540_80_s_c1.jpg", " https://media.blogto.com/articles/20191108-Lapinou6.jpg?w=2048&cmd=resize_then_crop&height=1365&quality=70", "https://www.seriouseats.com/thmb/HmQlgEiE4MKSuzKCDXOYFy1KBeA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__recipes__images__2013__08__081413-262367-cook-the-book-ratatouille-tian-b39312c64f4d48018ef58bc761ee598e.jpg", "https://assets.epicurious.com/photos/618585ef42d0416d3e639a1d/1:1/w_2560%2Cc_limit/Apples-and-Honey-Brie.jpg", "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/roast-rabbit-with-thyme-7db5997.jpg", "https://www.tasteofhome.com/wp-content/uploads/2018/01/Chocolate-and-Vanilla-Creme-Brulee_EXPS_BOBMZ22_44956_E10_06_3b-8.jpg"]
    @gallery_3 = ["https://www.thetimes.co.uk/imageserver/image/%2Fmethode%2Ftimes%2Fprod%2Fweb%2Fbin%2F5297e8c0-9094-11e6-8d9f-b994bff2c484.jpg?crop=2721%2C4082%2C405%2C1444&resize=412", "https://www.onceuponachef.com/images/2022/04/cacio-e-pepe.jpg", "https://italianchef.com/wp-content/uploads/2011/07/ProsciuttoAndMelon.jpg", "https://www.giallozafferano.it/images/239-23941/Pasta-e-fagioli_450x300.jpg", "https://www.maricruzavalos.com/wp-content/uploads/2020/10/penne-pomodoro-recipe.jpg", " https://www.abakingjourney.com/wp-content/uploads/2021/01/Lemon-Ricotta-Cake-Feature.jpg"]
    @gallery_4 = ["https://i2-prod.mirror.co.uk/incoming/article25508755.ece/ALTERNATES/s615b/3_Gino-DAcampo-says-he-blew-%C2%A31m-on-personalised-military-boat-hes-never-used.jpg", "https://www.seriouseats.com/thmb/CpfMCdoSDXTdR6C0KXEiIvM-9Jc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__recipes__images__2014__08__20140818-tomato-sauce-vicky-wasik-3-5a82a74045764203a01410754b129601.jpg", "https://img2.10bestmedia.com/Images/Photos/360300/gettyimages-534099035_54_990x660.jpg", "https://www.licious.in/blog/wp-content/uploads/2020/12/Italian-Fish.jpg", "https://www.seriouseats.com/thmb/QChcw6d_9s7rS4h57ADKBWEvxv4=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/the-best-slow-cooked-bolognese-sauce-recipe-hero-03_1-3bf4f3401fa84c828f68071df496ddd3.JPG", "https://www.cucinabyelena.com/wp-content/uploads/2020/10/0Z4A0214-e1654876530730.jpg"]
    @gallery_5 = ["https://bcm-agency.com/wp-content/uploads/2022/04/Kochar-Atul.png", "https://ychef.files.bbci.co.uk/976x549/p07cj8zj.jpg", "https://www.blueosa.com/wp-content/uploads/2020/07/Matar-Paneer-Peas-and-Cooked-Cottage-Cheese.jpg", "https://arbuz.com/wp-content/uploads/2019/04/Easy-Naan-Recipe.jpg", " https://vismaifood.com/storage/app/uploads/public/8b4/19e/427/thumb__700_0_0_0_auto.jpg", "https://www.vegrecipesofindia.com/wp-content/uploads/2018/02/bengali-mishti-doi-recipe-1-500x375.jpg"]
    @gallery_6 = ["https://www.favouritetables.com/wp-content/uploads/2017/08/MICHAEL-CAINES.jpg", "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-560671_12-f9e79e3.jpg", "https://img.bestrecipes.com.au/h7DSYIX1/w643-h428-cfill-q90/br/2021/02/coronation_chicken_pasta_final-961667-1.jpg", "https://secretldn.com/wp-content/uploads/2021/06/shutterstock_1510928255-2.jpg", "https://www.thespruceeats.com/thmb/_pUQl1xTgeknttnhA6OYN5QliM8=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/traditional-mushy-peas-recipe-435950-hero-01-962d10e31d6c40399787f9728b16a246.jpg", "https://images.food52.com/Btf1eMV0NCd5A94NZ5_c7i4lmHw=/1200x675/8caf639e-c2d2-480e-8832-980a308133d3--2021-0525_victoria-sponge-cake_3x2_rocky-luten_015.jpg"]
    @images = [@gallery_1, @gallery_2, @gallery_3, @gallery_4, @gallery_5, @gallery_6]
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
