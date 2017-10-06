require 'spec_helper'

describe 'the home path', {type: :feature} do
  it "will take you to the home page" do
    visit('/')
    click_link('Home')
    expect(page).to have_content("Welcome to your Organizer")
  end
end

describe 'the store paths', {type: :feature} do
  it "will take you to the store list page" do
    store = Store.create({name: "Shoes R Us"})
    visit('/')
    click_link('Stores')
    expect(page).to have_content("Shoes R Us")
  end

  it "will take you to store's page" do
    store = Store.create({name: "Shoes R Us"})
    visit('/stores_list')
    click_link('Shoes R Us')
    expect(page).to have_content("Shoes R Us")
  end

  it "will change the name of the store" do
    store = Store.create({name: "Shoes R Us"})
    visit("/store/#{store.id}")
    fill_in('update_name', :with => 'Shoes Shoes Shoes')
    click_button('Update Store Name')
    expect(page).to have_content("Update Store Name")
  end

  it "will add a shoe brand to store" do
    store = Store.create({name: "Shoes R Us"})
    brand = Brand.create({name: "Nike", price: 50})
    visit("/store/#{store.id}")
    fill_in('name', :with => 'Nike')
    click_button('Add Shoe Brand')
    expect(page).to have_content("Nike")
  end
end

describe 'the brands path', {type: :feature} do
  it 'will take you to brand list page' do
    brand = Brand.create({name: "Nike", price: 50})
    visit '/'
    click_link 'Brands'
    expect(page).to have_content("Nike")
  end

  it 'will add brand to list' do
    visit 'brands_list'
    fill_in 'name', :with => "Puma"
    fill_in 'price', :with => 50
    click_button 'Add Brand'
    expect(page).to have_content("Puma")
  end

  it "will go to brand's page" do
    brand = Brand.create({name: "Nike", price: 50})
    visit '/brands_list'
    click_link 'Nike'
    expect(page).to have_content("Nike")
  end

  it "will change brand name" do
    brand = Brand.create({name: "Nike", price: 50})
    visit "/brand/#{brand.id}"
    fill_in 'update_name', :with => "Puma"
    click_button 'Update Brand Name'
    expect(page).to have_content("Puma")
  end

  it "will change brand name" do
    brand = Brand.create({name: "Nike", price: 50})
    visit "/brand/#{brand.id}"
    fill_in 'update_price', :with => "25"
    click_button 'Update Brand Price'
    expect(page).to have_content("$25.00")
  end

  it 'will delete brand name' do
    brand = Brand.create({name: "Nike", price: 50})
    visit "/brand/#{brand.id}"
    click_button 'Delete Brand'
    expect(page).to have_no_content("Nike")
  end
end
