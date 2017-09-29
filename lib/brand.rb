class Brand < ActiveRecord::Base
  has_many :stores, through: :brands_stores
end
