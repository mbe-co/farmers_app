module Backoffice
  class CustomersController < ApplicationController
    include AdminsOnly

    def index
      @customers = Customer.active
    end
  end
end