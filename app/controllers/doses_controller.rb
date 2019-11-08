class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]
  def new
    @dose = Dose.new
    @ingredient = Ingredient.new
  end

  def create
    #find using set cocktail, then assign the cocktail of the dose to whatever you found
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private 
  # so you find a cocktail using cocktail_id
  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  #dose params require a description, ingredient id and a cocktail_id
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
