class Admin::CategoriesController < ApplicationController

  http_basic_authenticate_with name: ENV["HTTP_BASIC_USER"], password: ENV["HTTP_BASIC_PASSWORD"]

  
  def index
    @categories = Category.all.sort
    # @category_count = Category.joins("JOIN products ON categories.id = category_id").where("categories.id": params[:id])

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

end
