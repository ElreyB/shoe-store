class Store < ActiveRecord::Base
  has_many :brands, through: :brands_stores
end
