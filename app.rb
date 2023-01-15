require 'sinatra/base'
require "sinatra/reloader"

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    return erb(:index)
  end

  post '/hello' do
    @name = params[:name]
    if invalid_character?(params[:name])==nil
      return status 400
    else erb(:hello)
  end
end

  def invalid_character?(string)
      string.match(/\A[[:alpha:][:blank:]]+\z/)
  end
end
