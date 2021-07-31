class AddressController < ApplicationController
  before_action :authenticate_customer!
  before_action :find_or_initialize_address, only: [:edit, :update]

  def edit
  end

  # PATCH
  def update
    @address.attributes = address_params

    if @address.save
      redirect_to profile_address_path, notice: t('messages.success_on_edit')
    else
      render :edit
    end
  end

  private

  def address_params
    params
      .require(:address)
      .permit(:zipcode, :street, :number, :complement, :neighborhood, :city, :state)
  end

  def find_or_initialize_address
    @address ||= Address.find_or_initialize_by(customer_id: current_customer.id)
  end
end
