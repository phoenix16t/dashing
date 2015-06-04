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

Sinatra::Application::DbData = []
Sinatra::Application::User = 'User'
user = 'User'

refresh = false

SCHEDULER.every '1s' do
  if Sinatra::Application::User != user

    refresh = user == 'User' ? 'slow' : 'fast'

    user = Sinatra::Application::User

    allRecords = User.find_by_sql('select * from users u, widget_accesses wa, widgets w
    where u.userId = wa.userId
    and wa.widgetId = w.widgetId
    and u.email ="' + user + '"')
    Sinatra::Application::DbData = allRecords.as_json
  end
end

SCHEDULER.every '5s' do
  if refresh == 'slow'
    send_event('blah', {event: 'reload', dashboard: 'sample'}, 'dashboards')
    refresh = false
  end
end

SCHEDULER.every '1s' do
  if refresh == 'fast'
    send_event('blah', {event: 'reload', dashboard: 'sample'}, 'dashboards')
    refresh = false
  end
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
