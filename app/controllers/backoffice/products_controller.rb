module Backoffice
  class ProductsController < ApplicationController
    include AdminsOnly

    def index
      @products = Product.all
    end
  end
end
