module Backoffice
  class CustomersController < ApplicationController
    include AdminsOnly

    def index
      @statuses = Customer.statuses
      @customers = Customer.active
    end
  end
end