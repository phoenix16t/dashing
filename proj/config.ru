require 'omniauth/strategies/google_oauth2'
require 'dashing'
require 'yaml'
require 'sinatra'

configure do
  set :access_token, ENV['AUTH_TOKEN']
  if Sinatra::Base.development?
    helpers do

      def protected!
        redirect '/auth/google_oauth2' unless session[:user_id]
      end

    end

    use Rack::Session::Cookie, secret: ENV['secret']


    use OmniAuth::Builder do
      provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV["GOOGLE_CLIENT_SECRET"]
    end

    get '/auth/google_oauth2/callback' do
      if auth = request.env['omniauth.auth']
        #if auth['info']['email'].split('@')[1] != 'leftfieldlabs.com'
        #  redirect '/auth/failure'
        #end
        session[:user_id] = auth['info']['email']
        Sinatra::Application::User = auth['info']['email']
        redirect '/sample'
      else
        redirect '/auth/failure'
      end
    end

    get '/auth/failure' do
      'Nope.'
    end
  end
end
map Sinatra::Application.assets_prefix do
  run Sinatra::Application.sprockets
end

run Sinatra::Application