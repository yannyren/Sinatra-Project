require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/type')




get '/types' do 
  @types = Type.all()
  erb(:"/types/index")
end 

get '/types/new' do 
  erb(:"/types/new")
end 

post '/types' do
  Type.new(params).save
  redirect to '/types'
end 

get '/types/:id' do
  @type = Type.find(params["id"])
  erb(:"/types/show")
end 
  
delete '/types/:id' do
  type = Type.find(params["id"])
  type.delete
  redirect to '/types'
end


