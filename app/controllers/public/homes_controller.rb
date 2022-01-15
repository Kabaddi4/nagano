class Public::HomesController < ApplicationController
  def top
    @homes = Item.last(4)
  end

  def about
  end
end
