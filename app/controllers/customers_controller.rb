class CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end
end
