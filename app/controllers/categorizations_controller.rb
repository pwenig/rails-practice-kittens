class CategorizationsController < ApplicationController
  def new
    @categorization = Categorization.new
    @kitten = Kitten.find(params[:kitten_id])
  end


  def create
    @kitten = Kitten.find(params[:kitten_id])
    @categorization = @kitten.categorizations.new(category_attributes)
    if @categorization.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def category_attributes
    params.require(:categorization).permit(:category_id)
end
end