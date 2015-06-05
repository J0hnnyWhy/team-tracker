require('sinatra')
require('sinatra/reloader')
# require('./lib/team')
require('./lib/member')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end
