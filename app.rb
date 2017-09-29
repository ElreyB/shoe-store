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

get("/comments") do
  @comments = Comment.all
  erb(:comments)
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
  if brand_name != ""
    brand = Brand.where(name: brand_name).first
    if !store.brands.include?(brand)
      store.brands.push(brand)
    end
  end
  # binding.pry
  redirect back
end

post("/add_comment") do
  comment = Comment.create({name: params['name'], email: params['email'], comment: params['comment']})
  redirect '/comments'
end

patch("/update_name/store/:id") do
  store = Store.find(params[:id])
  store.update({name: params['update_name']})
  redirect "store/#{store.id}"
end

patch("/update_name/brand/:id") do
  brand = Brand.find(params[:id])
  brand.update({name: params['update_name']})
  redirect "brand/#{brand.id}"
end

patch("/update_price/brand/:id") do
  brand = Brand.find(params[:id])
  brand.update({price: params['update_price']})
  redirect "brand/#{brand.id}"
end

delete("/delete_store/:id") do
  store = Store.find(params[:id])
  Store.where(id: store.id).destroy_all
  redirect "stores_list"
end

delete("/delete_brand/:id") do
  brand = Brand.find(params[:id])
  Brand.where(id: brand.id).destroy_all
  redirect "brands_list"
end

delete("/delete_comment") do
  comment = Comment.find(params['delete_comment'])
  Comment.where(id: comment.id).destroy_all
  redirect "comments"
end
