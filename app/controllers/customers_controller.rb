class CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @user = current_customer
  end
end
