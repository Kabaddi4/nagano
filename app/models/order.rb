class Order < ApplicationRecord

  #支払い方法
  enum payment_method: { credit_card: 0, transfer: 1 }
  belongs_to :customer
  has_many :order_detail

  validates :name, presence: true
  validates :address, presence: true
  validates :postal_code, presence: true
end
