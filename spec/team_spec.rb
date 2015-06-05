require('rspec')
require "pry"
require('member')
require('team')
require "capybara/rspec"
require "./app"
Capybara.app = Sinatra::Application

describe('Team') do
  before() do
    Team.clear()
  end

  describe('#initialize', '#attr_reader') do
  it("returns the details of a team") do
    test_team = Team.new("The Yardbirds")
    expect(test_team.name()).to(eq("The Yardbirds"))
  end
end

  describe('.all') do
  it("returns all of the teams") do
    test_team = Team.new("The Yardbirds")
    test_team.save
    expect(Team.all()).to(eq([test_team]))
    end
  end

  describe('#save') do
  it("saves a team to the previously saved teams") do
    test_team2 = Team.new("The Birds")
    test_team2.save
    expect(Team.all()).to(eq([test_team2]))
    end
  end

  describe('.clear') do
  it("clears all of the previously saved teams") do
    test_team2 = Team.new("The Birds")
    Team.clear
    expect(Team.all()).to(eq([]))
    end
  end

end
