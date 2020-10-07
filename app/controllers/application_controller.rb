require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  

  get '/articles' do
    @articles = Article.all
    erb :index
  end
  

  get '/articles/new' do
    erb :new
  end

  

  get '/articles/:id' do
    @article = Article.all.where("id = ?",params[:id])[0]
    erb :show
  end

  get "/articles/:id/edit" do
    @article = Article.all.where("id = ?",params[:id])[0] 
    erb :edit
  end


  post '/articles' do
    @id = Article.create(:title => params[:article][:title], :content => params[:article][:content]).id
    redirect "/articles/#{@id}"
  end

  patch '/articles/:id' do
    @article = Article.all.where("id = ?",params[:id])[0]
    @article.update(:title => params[:article][:title], :content => params[:article][:content])
    redirect "articles/#{@article.id}"
  end

  delete '/articles/:id' do
    @article = Article.all.where("id = ?",params[:id])[0]
    @article.destroy
  end
 

end
