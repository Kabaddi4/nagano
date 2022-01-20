class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :addresss
  has_many :cart_items

  enum is_deleted: { owned: false, withdrawal: true }

  def active_for_authantication?
    super && !is_deleted
  end
end
