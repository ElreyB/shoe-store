require 'spec_helper'

describe 'Brand' do
  let(:brand) { Brand.new({name: "nike"})}

  describe '#capitalizes_name' do
    it 'will capitalizes every word in brand name' do
      brand.save
      expect(brand.name).to eq "Nike"
    end
  end
end
