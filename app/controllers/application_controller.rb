
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  post '/posts' do
    new_guy = Post.create(params)

    erb :index
  end

  get '/posts/new' do
    erb :new
  end


  get '/posts/:id' do
    @posty = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @posty = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @posty = Post.find(params[:id])
    @posty.name = params[:name]
    @posty.content = params[:content]
    @posty.save

    erb :show
  end

  delete '/posts/:id/delete' do
    @posty = Post.find(params[:id])
    @posty.destroy

    erb :index

  end
end
