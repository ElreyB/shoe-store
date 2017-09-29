require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

require 'pry'


get("/") do
  erb(:index)
end

get("/store_list") do
  @stores = Store.all
  erb(:store_list)
end

get("/stores/:id") do
  @store = Store.find(params[:id])
  erb(:stores)
end

post("/add_store") do
  store = Store.new({name: params['name']})
  store.save
  redirect 'stores_list'
end

delete("/delete_store/:id") do
  store = Store.find(params[:id])
  Store.where(id: store.id).destroy_all
  redirect "store_list"
end
