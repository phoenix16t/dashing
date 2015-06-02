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

class Widget < ActiveRecord::Base
end

# ActiveRecord::Migration.create_table :test do |t|
#   t.string :name
# end

class App < Sinatra::Application
  # @a = 1;
  # set a, 'sldkjfsldkjf'
end

# get '/' do
#   p User.all
# end

# p = Test.new
# p.name = 'asldkfj'
# puts p.name

allRecords = Widget.all
allRecords = allRecords.as_json
puts allRecords

# # get '/hello/' do
# #     erb "test"
# # end

# get '/' do
#   test = "sdlkfjsdlkfj"
#   erb test
#   puts test

#   puts a

#   p = Test.new
#   p.name = 'asldkfj'
#   puts p.name

#   # :locals => {:test => 'blah'}

#   # set test => 'alskdfj'
# end

# get '/sample' do
#   test = "sdlkfjsdlkfj"
#   erb test
#   puts test

#   puts a

#   p = Test.new
#   p.name = 'asldkfj'
#   puts p.name

#   # :locals => {:test => 'blah'}

#   # set test => 'alskdfj'
# end

# Sinatra::Application::Bbb = ['
#     <li data-row="1" data-col="1" data-sizex="2" data-sizey="1">
#       <div data-id="time" data-view="Clock" data-title="Time" style="background-color:#ff9618"></div>
#     </li>
# ',
# '    <li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
#       <div data-id="valuation" data-view="Number" data-title="Current Valuation" data-moreinfo="In billions" data-prefix="$"></div>
#     </li>
# ']

Sinatra::Application::DbData = allRecords

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
