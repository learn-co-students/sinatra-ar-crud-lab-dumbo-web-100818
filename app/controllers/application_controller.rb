
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  post '/posts' do
    @post = Post.create(params)
    redirect to "/posts"
  end


  get '/posts' do
    @posts = Post.all
    # require 'pry' ; binding.pry
    erb :index
  end


  get '/posts/new' do
    erb :new
  end


  get '/posts/:id' do
    @post=Post.all.find(params[:id])
    erb :show
  end


  get '/posts/:id/edit' do
    @post=Post.all.find(params[:id])
  erb :edit
  end

  delete '/posts/:id' do
    @post=Post.find(params[:id])
    @post.delete
    redirect to "/posts"
  end



end
