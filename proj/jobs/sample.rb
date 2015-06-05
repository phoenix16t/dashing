require 'sinatra'
require 'active_record'
require 'mysql2'

ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :host     => "localhost",
  :username => "",
  :password => "",
  :database => "test"
)

class User < ActiveRecord::Base
end

class Widget_Access < ActiveRecord::Base
end

Sinatra::Application::DbData = User.find_by_sql(
  'select * from users u, widget_accesses wa, widgets w
  where u.userId = wa.userId
  and wa.widgetId = w.widgetId')

Sinatra::Application::Layout = User.find_by_sql(
  'select * from users')


post '/fix_layout' do
  email = params[:email]
  layout = params[:layout]
  user = User.find_by(email: email)
  user.layout = layout
  user.save

  Sinatra::Application::Layout = User.find_by_sql(
    'select * from users')
end

post '/set_widget' do
  userId = params[:userId]
  widgetId = params[:widgetId]
  isOpened = params[:isOpened]
  user = User.find_by(userId: userId)
  user.layout = ''
  user.save
  wa = Widget_Access.find_by(userId: userId, widgetId: widgetId)
  wa.opened = isOpened
  wa.save

  Sinatra::Application::Layout = User.find_by_sql(
    'select * from users')

  Sinatra::Application::DbData = User.find_by_sql(
    'select * from users u, widget_accesses wa, widgets w
    where u.userId = wa.userId
    and wa.widgetId = w.widgetId')

  send_event('refresh_dashboard', {event: 'reload', dashboard: 'sample'}, 'dashboards')
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
