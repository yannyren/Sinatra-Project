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

get '/students/:id/edit' do
  @student = Student.find(params["id"])
  @companies = Company.all()
  erb(:"/students/edit")
  # redirect to '/students' 
end 

post '/students/:id' do
  student = Student.new(params)
  student.update
  redirect to '/students'
end 
  
delete '/students/:id' do
  student = Student.find(params["id"])
  student.delete
  redirect to '/students'
end


