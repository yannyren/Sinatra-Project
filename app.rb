require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('./controllers/company_controller')
require_relative('./controllers/student_controller')
also_reload( './models/*.rb') if development?

set :image_path, '/images'

get "/" do
  erb(:index)
end 

