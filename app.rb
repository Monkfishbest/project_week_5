
require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/members_controller')
require_relative('controllers/exercise_classes_controller')
require_relative('controllers/booking_infos_controller')

get '/' do
  erb( :index )
end
