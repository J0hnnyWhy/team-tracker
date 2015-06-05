require('sinatra')
require('sinatra/reloader')
require('./lib/team')
require('./lib/member')
also_reload('lib/**/*.rb')

get('/') do
  @teams = Team.all
  erb(:index)
end

post('/') do
  team = params.fetch('team')
  Team.new(team).save
  @teams = Team.all
  erb(:index)
end
