require './environment'


module FormsLab
  class App < Sinatra::Base

    get '/' do
      erb :root
    end

    get '/new' do
      erb :new
    end

    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])
      @feet = @pirate.height.split("'")[0]
      @inches = @pirate.height.split("'")[1]
      
      params[:pirate][:ships].each do |details|
        Ship.new(details)
      end

      @ships = Ship.all

      erb :show
    end

  end
end
