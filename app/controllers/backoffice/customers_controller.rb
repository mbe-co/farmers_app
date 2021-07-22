module Backoffice
  class CustomersController < ApplicationController
    include AdminsOnly

    before_action :list_statuses, only: [:index]

    def index
      @q = Customer.ransack(params[:q])
      @customers = @q.result
    end

    private

    def list_statuses
      @statuses = Customer.statuses
    end
  end
end
