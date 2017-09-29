require 'spec_helper'

describe 'Brand' do
  let(:brand) { Brand.new({name: "nike", price: 50})}

  describe '#capitalizes_name' do
    it 'will capitalizes every word in brand name' do
      brand.save
      expect(brand.name).to eq "Nike"
    end
  end

  context 'when name is left blank' do
    it 'validates presence of name' do
      brand = Brand.new({name: "", price: 50})
      expect(brand.save).to eq false
    end
  end

  context 'when name is present' do
    it 'validates presence of name' do
      brand = Brand.new({name: "Samnick", price: 50})
      expect(brand.save).to eq true
    end
  end

  it 'validates uniqueness of name' do
    brand = Brand.new({name: "Reback", price: 50})
    brand.save
    brand2 = Brand.new({name: "Reback", price: 50})
    expect(brand2.save).to eq false
  end

  it 'ensures the length of name is at most 100 characters' do
    brand = Brand.new({name: ("a" * 101), price: 50})
    expect(brand.save).to eq false
  end

  describe '#currency_formater' do
    it 'will save price input to currency format' do
      brand = Brand.new({name: "Sneak", price: 50})
      brand.save
      p brand.price
      expect(brand.price).to eq "$50.00"
    end
  end

  context 'when price is not present' do
    it 'validates presence of price' do
      brand = Brand.new({name: "Smiths"})
      expect(brand.save).to eq false
    end
  end
  # 
  # context 'when size is not present' do
  #   it 'validates presence of size' do
  #     brand = Brand.new({name: "Smiths", price: 4})
  #     expect(brand.save).to eq false
  #   end
  # end
end
