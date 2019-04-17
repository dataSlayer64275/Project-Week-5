require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/artist_controller.rb')
require_relative('controllers/exhibition_controller.rb')
also_reload( '../models/*' )

get '/' do
  erb :home
end

get '/manager' do
  @manager_view = true
  erb :home, :layout => :layout_manager
end

get '/manager_login' do
  @manager_view = true
  erb :home, :layout => :layout_manager
end

get'/about_us' do
  erb :about_us
end

get '/about_us_manager' do
  @manager_view = true
  erb :about_us, :layout => :layout_manager
end
