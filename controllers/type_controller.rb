require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/student')
require_relative('../models/company')
require_relative('../models/type')
require_relative('../models/job')



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

get '/types/:id/edit' do
  @type = Type.find(params["id"])
  erb(:"/types/edit")
end 

post '/types/:id' do
  type = Type.new(params)
  type.update
  redirect to '/types'
end 
  
delete '/types/:id' do
  type = Type.find(params["id"])
  type.delete
  redirect to '/types'
end


