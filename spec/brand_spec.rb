require 'spec_helper'

describe 'Brand' do
  let(:brand) { Brand.new({name: "nike"})}

  describe '#capitalizes_name' do
    it 'will capitalizes every word in brand name' do
      brand.save
      expect(brand.name).to eq "Nike"
    end
  end

  it 'validates presence of name' do
    brand = Brand.new({name: ""})
    expect(brand.save).to eq false
  end
end
