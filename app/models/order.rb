class Order < ApplicationRecord

  #支払い方法
  enum payment_method: { credit_card: 0, transfer: 1 }
end
