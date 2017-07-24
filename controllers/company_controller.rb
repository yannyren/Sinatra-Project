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

get '/companies/:id/edit' do
  @company = Company.find(params["id"])
  erb(:'/companies/edit')
end 

post '/companies/:id' do
  company = Company.new(params)
  company.update
  redirect to '/companies'
end 

delete '/companies/:id' do
  company = Company.find(params["id"])
  company.delete
  redirect to '/companies'
end 



