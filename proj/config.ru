require 'dashing'

configure do
  set :auth_token, 'YOUR_AUTH_TOKEN'

  helpers do
    def protected!
     # Put any authentication code you want in here.
     # This method is run before accessing any resource.
    end
  end
end

map Sinatra::Application.assets_prefix do
  run Sinatra::Application.sprockets
end

run Sinatra::Application

Sinatra::Application::Aaa = ['
    <li data-row="1" data-col="1" data-sizex="2" data-sizey="1">
      <div data-id="time" data-view="Clock" data-title="Time" style="background-color:#ff9618"></div>
    </li>
',
'    <li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
      <div data-id="valuation" data-view="Number" data-title="Current Valuation" data-moreinfo="In billions" data-prefix="$"></div>
    </li>
']