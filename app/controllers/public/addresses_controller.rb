class Public::AddressesController < ApplicationController

  def index
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address, :created_at, :updated_at)
  end
end
