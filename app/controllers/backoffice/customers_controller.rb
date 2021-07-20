module Backoffice
  class CustomersController < ApplicationController
    include AdminsOnly

    def index
      @statuses = Customer.statuses

      @customers = if params[:status].present? && params[:query].present?
                     Customer.by_status(params[:status]).by_name_or_email(params[:query])
                   elsif params[:status].present?
                     Customer.by_status(params[:status])
                   elsif params[:query].present?
                     Customer.by_name_or_email(params[:query])
                   else
                     Customer.active
                   end
    end
  end
end
