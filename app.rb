require('sinatra')
require('sinatra/contrib/all') if development?
require('pry')
require_relative('./controllers/company_controller')
require_relative('./controllers/student_controller')
require_relative('./controllers/job_controller')
require_relative('./controllers/type_controller')
also_reload( './models/*.rb') if development?

set :image_path, '/images'

get "/" do
  erb(:index, :layout => false)
end 

