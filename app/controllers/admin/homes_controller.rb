class Admin::HomesController < ApplicationController
  def top
    binding.pry
    @orders = Order.all
  end
end
