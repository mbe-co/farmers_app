module Backoffice
  class CustomersController < ApplicationController
    include AdminsOnly

    def index
      @statuses = Customer.statuses
      @customers =  if params[:status]
                      Customer.where('status = ?', params[:status])
                    else
                      Customer.active
                    end
    end
  end
end