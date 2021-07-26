class AddressController < ApplicationController
  before_action :authenticate_customer!

  def edit
    @address = Address.find_or_initialize_by(customer_id: current_customer.address)
  end
end
