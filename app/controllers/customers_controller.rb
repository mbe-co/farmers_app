class CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_customer, only: [:edit, :update, :reset_password]

  def edit
  end

  def update
    if @customer.update(customer_params)
      redirect_to profile_path, notice: t('messages.success_on_edit')
    else
      render :edit
    end
  end

  def reset_password
    @customer.send_reset_password_instructions
    redirect_to profile_path, notice: 'As instruções foram enviadas para o email cadastrado'
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :phone)
  end

  def set_customer
    @customer = current_customer
  end
end
