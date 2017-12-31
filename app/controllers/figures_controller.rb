class FiguresController < ApplicationController
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.landmarks << Landmark.create(name: params[:landmark][:name]) if !params[:landmark][:name].empty?
    @figure.titles << Title.create(name: params[:title][:name]) if !params[:title][:name].empty?
    @figure.save

    redirect to '/figures/:id'
  end

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end

  post '/figures/:id' do
    binding.pry
    @figure = Figure.find_by_id(:id)
    @figure.name = params[:figure][:name]
    @figure.save
    redirect to '/figures/:id'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'/figures/show'
  end
end
