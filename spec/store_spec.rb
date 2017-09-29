require 'spec_helper'

describe 'Store' do
  let(:store) { Store.new({name: "nike store"})}

  describe '#capitalizes_name' do
    it 'will capitalizes every word in store name' do
      store.save
      expect(store.name).to eq "Nike Store"
    end
  end
end
