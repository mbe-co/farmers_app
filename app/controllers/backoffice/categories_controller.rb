module Backoffice
  class CategoriesController < ApplicationController
    def index
      @categories = Category.all
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to backoffice_categories_path
      else
        render :new
      end
    end
    def edit
    end

    def update
    end

    def destroy
    end

    end
    private

      def set_category
        @category = Category.find(params[:id])
      end

      def category_params
        params.require(:category).permit(:name)
      end
  end
end