require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('../models/booking_info')
require_relative('../models/exercise_class')
require_relative('../models/members')
also_reload('../models/*')

get '/booking-info' do
  @bookings = BookingInfo.all
  erb (:"bookings/index")
end

get '/booking-info/new' do
  @members = Member.all
  @classes = ExerciseClass.all
  erb(:"bookings/create")
end

post '/booking-info/new' do
  @booking = BookingInfo.new(params)
  @booking.save
  redirect to("/booking-info")
end

post '/booking-info/:id/delete' do
  BookingInfo.remove(params[:id])
  redirect to("booking-info")
end
