require './config/environment'

#ActiveRecord::Base.establish
#   raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
# end

use Rack::MethodOverride 

use TravelsController 
use UsersController
run ApplicationController


