module Backoffice
  class ProductsController < ApplicationController
    include AdminsOnly

    before_action :find_category, only: [:create]

    def index
      @products = Product.all
    end

    def new
      @product = Product.new
    end

    def create
      @product = @category.products.build(product_params)

      if @product.save
        redirect_to backoffice_products_path, notice: t('messages.success_on_create')
      else
        render :new
      end
    end

    private

    def product_params
      params.require(:product)
            .permit(:name, :category, :status)
            .except(:category)
    end

    def find_category
      @category = Category.find(params.dig(:product, :category))
    end
  end
end
