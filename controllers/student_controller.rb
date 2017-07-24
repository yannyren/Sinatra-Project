require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/student')
require_relative('../models/company')


get '/students' do 
  @students = Student.all()
  erb(:"/students/index")
end 

get '/students/new' do 
  @companies = Company.all()
  erb(:"/students/new")
end 

post '/students' do
  Student.new(params).save
  redirect to '/students'
end 

