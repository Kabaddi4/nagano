class Admin::HomesController < ApplicationController
  def top
    @orders = OrderDetail.all
  end
end
