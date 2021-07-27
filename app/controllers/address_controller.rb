class AddressController < ApplicationController
  before_action :authenticate_customer!
  before_action :find_address, only: [:edit, :update]

  def edit
  end

  # PATCH
  def update
    @address.tap do |obj|
      obj.zipcode = address_params[:zipcode]
      obj.street = address_params[:street]
      obj.number = address_params[:number]
      obj.complement = address_params[:complement]
      obj.neighborhood = address_params[:neighborhood]
      obj.city = address_params[:city]
      obj.state = address_params[:state]
    end

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

  def find_address
    @address = Address.find_or_initialize_by(customer_id: current_customer.id)
  end
end
