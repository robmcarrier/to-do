require './config/environment'

class ApplicationController < Sinatra::Base

    configure do
        set :views, 'app/views'
    end

    get '/' do
        @lists = List.all
        erb :index
    end

    get '/lists/new' do
        erb :'/lists/new'
    end

    get '/lists/:id' do
        @list = List.find_by_id(params[:id])
        erb :'/lists/show'
    end

    post '/lists' do
        @list = List.new
        @list.title = params[:title]
        @list.title = params[:type]
        @list.save

        redirect to '/'
    end

    post '/new_item' do
        item = Item.create(params[:items])
        item.list_id = params["test"]
        item.save

        redirect to "/lists/#{item.list_id}"
    end

    post '/remove_item' do
        item = Item.find_by_id(params["item"])
        item.destroy

        redirect to "/lists/#{params["test"]}"
    end

end
