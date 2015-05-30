require 'sinatra'
require 'active_record'
require 'mysql2'

ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :host     => "localhost",
  :username => "root",
  :password => "lfl",
  :database => "ruby"
)

class Test < ActiveRecord::Base
end

# ActiveRecord::Migration.create_table :test do |t|
#   t.string :name
# end

# class App < Sinatra::Application
# end

# get '/' do
#   p User.all
# end

# p = Test.new
# p.name = 'asldkfj'
# puts p.name

# a = Test.all
# a = a.as_json
# erb :a

# get '/hello/' do
#     erb "test"
# end

test = "sdlkfjsdlkfj"

current_valuation = 0
current_karma = 0

SCHEDULER.every '2s' do
  last_valuation = current_valuation
  last_karma     = current_karma
  current_valuation = rand(100)
  current_karma     = rand(200000)

  send_event('valuation', { current: current_valuation, last: last_valuation })
  send_event('karma', { current: current_karma, last: last_karma })
  send_event('synergy',   { value: rand(100) })
end
