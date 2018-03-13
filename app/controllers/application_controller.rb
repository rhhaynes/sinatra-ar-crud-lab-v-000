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
  
  get '/posts/new' do
    erb :new
  end
  
  get '/posts/:id' do
    @post = Post.find(params[:id].to_i)
    erb :show
  end
  
  get '/posts/:id/edit' do
    @post = Post.find(params[:id].to_i)
    erb :edit
  end
  
  post '/posts' do
    Post.create({name: params[:name], content: params[:content]})
    redirect "/posts"
  end
  
  delete '/posts/:id/delete' do
    @post = Post.find(params[:id].to_i)
    Post.destroy(@post.id)
    erb :delete
  end
  
  patch '/posts/:id' do
    Post.update(params[:id].to_i,{name: params[:name], content: params[:content]})
    redirect "/posts/#{params[:id]}"
  end
end
