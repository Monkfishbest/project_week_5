require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/exercise_class' )
also_reload( '../models/*' )

# INDEX
get '/classes' do
  @classes = ExerciseClass.all
  erb(:"classes/index")
end

# CREATE
get '/classes/new' do
  erb(:"classes/create")
end

post '/classes/new' do
  @class = ExerciseClass.new(params)
  @class.save
  erb(:"classes/new")
end

# EDIT
get '/classes/:id/edit' do
  @class = ExerciseClass.find(params[:id].to_i)
  erb(:"classes/edit")
end

post '/classes/:id/edit' do
  @class = ExerciseClass.new(params)
  @class.update
  redirect to('/classes')
end

# DELETE
get '/classes/:id/delete' do
  @class = ExerciseClass.find(params[:id].to_i)
  erb(:"classes/delete")
end

post '/classes/:id/delete' do
  @class = ExerciseClass.find(params[:id].to_i)
  @class.delete
  redirect to('/classes')
end
