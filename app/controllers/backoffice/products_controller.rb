module Backoffice
  class ProductsController < ApplicationController
    include AdminsOnly

    before_action :find_category, only: [:create]
    before_action :list_categories, only: [:new]
    before_action :list_statuses, only: [:new]

    def index
      @products = Product.all
    end

    def new
      @product = Product.new
    end

    def create
      @product = @category.products.build(product_params)
      @product.sanitize_name

      if @product.save
        redirect_to backoffice_products_path, notice: t('messages.success_on_create')
      else
        list_categories
        list_statuses
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

    def list_categories
      @categories = Category.all
    end

    def list_statuses
      @statuses = Product.statuses
    end
  end
end
