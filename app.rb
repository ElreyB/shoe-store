require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

require 'pry'


get("/") do
  erb(:index)
end

get("/stores_list") do
  @stores = Store.all
  erb(:stores_list)
end

get("/brands_list") do
  @brands = Brand.all
  erb(:brands_list)
end

get("/store/:id") do
  @store = Store.find(params[:id])
  erb(:store)
end

get("/brand/:id") do
  @brand = Brand.find(params[:id])
  erb(:brand)
end

post("/add_store") do
  store = Store.new({name: params['name']})
  if store.save
    redirect 'stores_list'
  else
    @error_type = store
    @route = "/stores_list"
    erb(:errors)
  end
end

post("/add_brand") do
  new_brand = Brand.new({name: params['name'], price: params['price']})

  if new_brand.save
    redirect 'brands_list'
  else
    @error_type = new_brand
    @route = "/brands_list"
    erb(:errors)
  end
end

post("/add_brand/:id") do
  store = Store.find(params[:id])
  brand_name = params['name']
  brand_price = params['price']
  brand = Brand.find_or_initialize(name: brand_name, price: brand_price)

  if new_brand.id
    if !store.brands.include?(new_brand)
      store.brands.push(new_brand)
    end
  else
    new_brand.save
    store.brands.push(new_brand)
  end
  redirect back
end

patch("/update_name/store/:id") do
  store = Store.find(params[:id])
  store.update({name: params['update_name']})
  erb redirect "store/#{store.id}"
end

delete("/delete_store/:id") do
  store = Store.find(params[:id])
  Store.where(id: store.id).destroy_all
  redirect "stores_list"
end
