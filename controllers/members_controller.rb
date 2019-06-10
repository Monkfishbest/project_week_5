require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/members' )
also_reload( '../models/*' )

# INDEX
get '/members' do
  @members = Member.all
  erb(:index)
end

# NEW
get '/members/new' do
  erb(:new)
end

# CREATE
post '/members' do
  @member = Member.new(params)
  @member.save
  erb(:create)
end

# EDIT
get '/members/:id/edit' do
  @member = Member.find(params[:id].to_i)
  erb(:edit)
end

post '/members/:id/edit' do
  @member = Member.new(params)
  @member.update
  redirect to('/members')
end

# DELETE
get '/members/:id/delete' do
  @member = Member.find(params[:id].to_i)
  erb(:delete)
end

post '/members/:id/delete' do
  @member = Member.find(params[:id].to_i)
  @member.delete
  redirect to('/members')
end
