class Api::V1::ProductsController < ApplicationController
  before_action :check_login, only: [:create]

  def show
    render json: Product.find(params[:id])
  end

  def index
    render json: Product.all
  end

  def create
    product = current_user.products.build(product_params)
    if product.save
      render json: product, status: :created
    else
      render json: { errors: product.errors }, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :price, :published)
  end
end