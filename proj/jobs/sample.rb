require 'sinatra'
require 'active_record'
require 'mysql2'

ActiveRecord::Base.establish_connection(
  :adapter  => 'mysql2',
  :host     => 'localhost',
  :username => 'root',
  :password => '',
  :database => 'ruby'
)

class User < ActiveRecord::Base
end

class Widget_Access < ActiveRecord::Base
end

post '/fetch_layout' do
  email = params[:email]
  data = User.find_by_sql(
  'select * from users u, widget_accesses wa, widgets w
  where u.email = "' + email + '" and u.userId = wa.userId and wa.widgetId = w.widgetId')

  halt 200, {email: email, data: data}.to_json
end

post '/fix_layout' do
  userId = params[:userId]
  layout = params[:layout]
  user = User.find_by(userId: userId)
  user.layout = layout
  user.save
end

post '/activate_widget' do
  userId = params[:userId]
  widgetId = params[:widgetId]
  isActivated = params[:isActivated]
  user = User.find_by(userId: userId)
  user.layout = ''
  user.save
  wa = Widget_Access.find_by(userId: userId, widgetId: widgetId)
  wa.activated = isActivated
  wa.save

  'Refresh'
end

current_valuation = 0
current_karma = 0

SCHEDULER.every '2s' do
  last_valuation = current_valuation
  last_karma     = current_karma
  current_valuation = rand(100)
  current_karma     = rand(200000)

  send_event('valuation', { current: current_valuation, last: last_valuation })
  send_event('karma', { current: current_karma, last: last_karma })
  send_event('synergy', { value: rand(100) })
end
