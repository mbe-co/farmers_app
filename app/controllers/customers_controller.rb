class CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_customer, only: [:edit, :update]

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to profile_path, notice: t('messages.success_on_edit')
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name)
  end

  def set_customer
    @customer = current_customer
  end
end
