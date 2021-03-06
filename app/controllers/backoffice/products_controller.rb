module Backoffice
  class ProductsController < ApplicationController
    include AdminsOnly

    before_action :find_product, only: [:edit, :update, :destroy]
    before_action :list_categories, only: [:new, :edit]
    before_action :list_statuses, only: [:new, :edit]

    def index
      @products = Product.includes(:category).all
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)

      if @product.save
        redirect_to backoffice_products_path, notice: t('messages.success_on_create')
      else
        list_categories
        list_statuses
        render :new
      end
    end

    def edit; end

    def update
      if @product.update(product_params)
        redirect_to backoffice_products_path, notice: t('messages.success_on_edit')
      else
        list_categories
        list_statuses
        render :edit
      end
    end

    def destroy
      @product.destroy
      redirect_to backoffice_products_path, notice: t('messages.success_on_destroy')
    end

    private

    def product_params
      params.require(:product).permit(:name, :category_id, :status)
    end

    def find_product
      @product = Product.find(params[:id])
    end

    def list_categories
      @categories = Category.all
    end

    def list_statuses
      @statuses = Product.statuses
    end
  end
end
