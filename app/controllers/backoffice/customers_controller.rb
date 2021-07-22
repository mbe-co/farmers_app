module Backoffice
  class CustomersController < ApplicationController
    include AdminsOnly

    def index
      @q = Customer.ransack(params[:q])
      @customers = @q.result
    end
  end
end
