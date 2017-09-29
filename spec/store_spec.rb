require 'spec_helper'

describe 'Store' do
  let(:store) { Store.new({name: "nike store"})}

  describe '#capitalizes_name' do
    it 'will capitalizes every word in store name' do
      store.save
      expect(store.name).to eq "Nike Store"
    end
  end

  context 'when name is left blank' do
    it 'validates presence of name' do
      store = Store.new({name: ""})
      expect(store.save).to eq false
    end
  end

  context 'when name is present' do
    it 'validates presence of name' do
      store = Store.new({name: "Samnick"})
      expect(store.save).to eq true
    end
  end

  it 'validates uniqueness of name' do
    store = Store.new({name: "Reback"})
    store.save
    store2 = Store.new({name: "Reback"})
    expect(store2.save).to eq false
  end

  it 'ensures the length of name is at most 100 characters' do
    store = Store.new({name: ("a" * 101)})
    expect(store.save).to eq false
  end
end
