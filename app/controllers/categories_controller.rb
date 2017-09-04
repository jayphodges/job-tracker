class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end


  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = "You created #{@category.title}"
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def update
    @category.update(category_params)
    if @category.save
      flash[:success] = "#{@category.title} updated!"
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    @category.destroy

    flash[:success] = "#{@category.title} was successfully deleted!"

    redirect_to companies_path
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:title)
    end
end
