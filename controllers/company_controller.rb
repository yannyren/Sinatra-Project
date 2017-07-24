require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/company')

get '/companies' do
  @companies = Company.all()
  erb(:"companies/index")
end 

get '/companies/new' do
  erb(:"companies/new")
end 

post '/companies' do
  Company.new(params).save
  redirect ('/companies')
end 



