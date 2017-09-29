class Brand < ActiveRecord::Base
  has_many :stores, through: :brands_stores

  validates(:name, {:presence => true, :uniqueness => true, :length => { :maximum => 100 }})
  validates(:price, {:presence => true})
  validates(:size, {:presence => true})

  before_save(:currency_formater)
  before_save(:capitalizes_name)

  private

  def capitalizes_name
    name = self.name.split(" ")
    self.name = name.map{ |word| word.capitalize }.join(" ")
  end

  def currency_formater
    self.price = "$#{self.price}.00"
  end
end
