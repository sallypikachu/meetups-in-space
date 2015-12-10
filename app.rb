require 'sinatra'
require_relative 'config/application'

helpers do
  def current_user
    user_id = session[:user_id]
    @current_user ||= User.find(user_id) if user_id.present?
  end
end

get '/' do
  redirect '/meetups'
end

get '/auth/github/callback' do
  user = User.find_or_create_from_omniauth(env['omniauth.auth'])
  session[:user_id] = user.id
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/meetups' do
  @meetups = Meetup.all
  erb :'meetups/index'
end

get '/meetup/:id' do
  @meetup = Meetup.where(id: params[:id])[0]
  @members = @meetup.users
  erb :'meetups/meetup'
end

post '/meetups' do

  redirect '/meetups'
end

post '/meetup/:id' do
  @meetup = Meetup.where(id: params[:id])[0]
  @members = @meetup.users
  @meetup.users << current_user 
  erb :'meetups/meetup'
end
