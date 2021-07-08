class CategoriesController < ApplicationController

  
    def index
      @categories = Category.all
    end

    def new
      @category = Category.new
    end
    
  
    def show
      @category = Category.find(params[:id])
    end
  
    def create
      @category = Category.new(category_params)
      @category.save
    end
  
    def update
      @category = Category.find(params[:id])
      @category.update_params(category_params)
    end
  
    def edit
      @category = Category.find(params[:id])
    end
  
    def destroy
      @category = Category.find(params[:id])
      @category.destroy

      redirect_to categories_path
    end
    private

    def category_params
      params.require(:category).permit(:name, :description)
    end

end