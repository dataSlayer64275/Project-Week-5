require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
require_relative( '../models/exhibition.rb' )
require_relative('../models/artist.rb')
require_relative('../models/category.rb')


get '/exhibitions/browse_by_artist' do
  @exhibitions = Exhibition.find_by_artist_id(params['artist_id'])
  @artists = Artist.all
  @category = Category.all
  erb (:"exhibitions/browse_by_artist")
end

get '/exhibitions' do
  @exhibitions = Exhibition.all
  @artists = Artist.all
  erb (:"exhibitions/index")
end

get '/exhibitions_manager' do
  @artists = Artist.all
  @exhibitions = Exhibition.all
  erb (:"m_exhibitions/manager_index"), :layout => :layout_manager
end

get '/exhibitions_manager/new' do
  @categories = Category.all
  @artists = Artist.all
  erb (:"m_exhibitions/new")
end

post '/exhibitions_manager' do
  exhibition = Exhibition.new(params)
  exhibition.save
  redirect to '/exhibitions_manager'
end

get '/exhibitions/:id' do
  @exhibition = Exhibition.find (params[:id])
  erb (:"exhibitions/show")
end

get '/exhibitions_manager/:id/edit' do
  @artists = Artist.all
  @categories = Category.all
  @exhibition = Exhibition.find( params[:id] )
  erb (:"m_exhibitions/edit")
end


get'/exhibitions_manager/:id' do
  @exhibition = Exhibition.find (params[:id])
  erb (:"m_exhibitions/manager_show"), :layout => :layout_manager
end

post '/exhibitions_manager/:id' do
  exhibition = Exhibition.new(params)
  exhibition.update
  redirect to '/exhibitions_manager'
end

post '/exhibitions_manager/:id/delete' do
  exhibition = Exhibition.find( params[:id] )
  exhibition.delete
  redirect to '/exhibitions_manager'
end
