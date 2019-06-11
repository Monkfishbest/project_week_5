require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/members' )
also_reload( '../models/*' )

# INDEX
get '/members' do
  @members = Member.all
  erb(:"members/index")
end

# CREATE
get '/members/new' do
  erb(:"members/create")
end

post '/members/new' do
  @member = Member.new(params)
  @member.save
  erb(:"members/new")
end

# EDIT
get '/members/:id/edit' do
  @member = Member.find(params[:id].to_i)
  erb(:"members/edit")
end

post '/members/:id/edit' do
  @member = Member.new(params)
  @member.update
  redirect to('/members')
end

# DELETE
get '/members/:id/delete' do
  @member = Member.find(params[:id].to_i)
  erb(:"members/delete")
end

post '/members/:id/delete' do
  @member = Member.find(params[:id].to_i)
  @member.delete
  redirect to('/members')
end
