require 'spec_helper'

describe 'Brand' do
  let(:brand) { Brand.new({name: "nike"})}

  describe '#capitalizes_name' do
    it 'will capitalizes every word in brand name' do
      brand.save
      expect(brand.name).to eq "Nike"
    end
  end

  context 'when name is left blank' do
    it 'validates presence of name' do
      brand = Brand.new({name: ""})
      expect(brand.save).to eq false
    end
  end

  context 'when name is present' do
    it 'validates presence of name' do
      brand = Brand.new({name: "Samnick"})
      expect(brand.save).to eq true
    end
  end

  it 'validates uniqueness of name' do
    brand = Brand.new({name: "Reback"})
    brand.save
    brand2 = Brand.new({name: "Reback"})
    expect(brand2.save).to eq false
  end
end
