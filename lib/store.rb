class Store < ActiveRecord::Base
  has_many :brands, through: :brands_stores

  before_save(:capitalizes_name)

  private

  def capitalizes_name
    name = self.name.split(" ")
    self.name = name.map{ |word| word.capitalize }.join(" ")
  end
end
