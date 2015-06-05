require('sinatra')
require('sinatra/reloader')
require('./lib/team')
require('./lib/member')
also_reload('lib/**/*.rb')
require('pry')

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

post('/team') do
   first = params.fetch('first')
   last = params.fetch('last')
   phone = params.fetch('phone')
   member = Member.new(first, last, phone)
   member.save
   team = Team.find(params.fetch('name'))
  #  binding.pry
  #  @team = team.add_member(member).save
   redirect back
 end
