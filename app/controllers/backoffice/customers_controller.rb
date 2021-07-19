module Backoffice
  class CustomersController < ApplicationController
    include AdminsOnly

    def index
      @statuses = Customer.statuses

      @customers =
        if params[:status].present? && params[:query].present?
          Customer.where('status = ? AND name LIKE ? OR email LIKE ?',
            params[:status], "%#{params[:query]}%", "%#{params[:query]}%")
        elsif params[:status].present?
          Customer.where('status = ?', params[:status])
        elsif params[:query].present?
          Customer.where('name LIKE ? OR email LIKE ?', "%#{params[:query]}%",
            "%#{params[:query]}%")
        else
          Customer.active
        end
    end
  end
end
