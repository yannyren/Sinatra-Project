require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/job')
require_relative('../models/company')
require_relative('../models/student')
require_relative('../models/type')



get '/jobs' do 
  @jobs = Job.all()
  erb(:"/jobs/index")
end 

get '/jobs/new' do 
  @jobs = Job.all()
  @students = Student.all()
  @companies = Company.all() 
  @types = Type.all()
  erb(:"/jobs/new")
end 

post '/jobs' do
  Job.new(params).save
  redirect to '/jobs'
end 

get '/jobs/:id/edit' do
  @job = Job.find(params["id"])
  @students = Student.all()
  @companies = Company.all() 
  @types = Type.all()
  erb(:"/jobs/edit")
end 

post '/jobs/:id' do
  job = Job.new(params)
  job.update
  redirect to '/jobs'
end 
  
post '/jobs/:id/delete' do
  job = Job.find(params[:id])
  job.delete
  redirect to '/jobs'
end


