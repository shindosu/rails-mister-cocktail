class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]
  before_action :set_rating, only: [:index, :show]
  
  def index
    if params[:query].present?
      @cocktails = Cocktail.where("name LIKE ?", "%#{params[:query]}")
    else
      @cocktails = Cocktail.all.order("name ASC")
    end
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail)
    else
      render :edit
    end
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private 
  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def set_rating
    @rating = {
      "0": 0,
      "1": 1,
      "2": 2,
      "3": 3,
      "4": 4,
      "5": 5      
    }
  end
end
