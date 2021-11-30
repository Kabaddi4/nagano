class Item < ApplicationRecord
  
  has_many :cart_item
  belongs_to :genre
  attachment :image
end
