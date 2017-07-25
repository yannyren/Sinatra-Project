require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/student')
require_relative('../models/company')
require_relative('../models/type')
require_relative('../models/job')

get '/students' do 
  @students = Student.all()
  erb(:"/students/index")
end 

get '/students/new' do 
  erb(:"/students/new")
end 

post '/students' do
  Student.new(params).save
  redirect to '/students'
end 

get '/students/:id' do
   @student = Student.find(params["id"])
   erb(:"/students/show")
end 

get '/students/:id/edit' do
  @student = Student.find(params["id"])
  erb(:"/students/edit")
end 

post '/students/:id' do
  if !params[:picture]
    params[:picture] = ""
  else
    filename = params[:picture][:filename]
    file = params[:picture][:tempfile]

    File.open("./public/images/#{filename}", "wb") do |f|
      f.write(file.read)
    end

    params[:picture] = filename
  end

  student = Student.new(params)
  student.update
  redirect to '/students'
end 
  
delete '/students/:id' do
  student = Student.find(params["id"])
  student.delete
  redirect to '/students'
end


