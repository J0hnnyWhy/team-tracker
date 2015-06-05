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


get('/team/:name') do
   @team = Team.find(params.fetch('name'))
   erb(:team)
end

post('team/:name') do
  first = params.fetch('first')
  last = params.fetch('last')
  phone = params.fetch('phone')
  member = Member.new(first, last, phone)
  @team = Team.find(params.fetch('name'))
  @team.add_member
  erb(:team)
end
