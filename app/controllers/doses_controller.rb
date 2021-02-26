class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
      @dose = Dose.new(dose_params)
        @dose.cocktail = @cocktail
        @ingredient = Ingredient.find(params[:dose][:ingredient_id])
        @dose.ingredient = @ingredient
        if @dose.save
          redirect_to @cocktail
        else
          render "cocktails/show"
        end
  end
    
  def destroy
    @dose = Dose.find(params[:id])
      @dose.destroy
      redirect_to cocktail_path(@dose.cocktail)
  end
    
  private
  def dose_params
    params.require(:dose).permit(:description)
  end
end
