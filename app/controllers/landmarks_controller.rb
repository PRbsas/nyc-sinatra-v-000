class LandmarksController < ApplicationController

  get '/' do
    redirect '/landmarks'
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/show'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark]) unless params[:landmark][:name].empty?
    @landmark.save
    redirect '/landmarks'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark]) unless params[:landmark].empty?
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end
end
