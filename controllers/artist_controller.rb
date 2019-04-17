require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/artist.rb' )

get '/artists' do
  @artists = Artist.all
  erb( :"artists/index" )
end

get '/artists_manager/new' do
  erb :"m_artists/new", :layout => :layout_manager
end

get '/artists_manager' do
  @artists = Artist.all
  erb :"m_artists/manager_index", :layout => :layout_manager
end

post '/artists_manager' do
  artist = Artist.new(params)
  artist.save
  redirect to "/artists_manager"
end

get'/artists/:id' do
  @artist = Artist.find (params[:id])
  erb (:"artists/show")
end

get '/artists_manager/:id/edit' do
  @artist = Artist.find( params[:id] )
  erb :"m_artists/edit", :layout => :layout_manager
end

post '/artists_manager/:id/delete' do
  artist = Artist.find( params[:id] )
  artist.delete()
  redirect to '/artists_manager'
end

get '/artists_manager/:id' do
  @artist = Artist.find (params[:id])
  erb (:"m_artists/manager_show"), :layout => :layout_manager
end

post '/artists_manager/:id' do
  artist = Artist.new(params)
  artist.update
  redirect to '/artists_manager'
end
