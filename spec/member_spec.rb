require('rspec')
require "pry"
require('member')
require "capybara/rspec"
require "./app"
Capybara.app = Sinatra::Application

describe('Member') do
  before() do
    Member.clear()
  end

  describe('#initialize','#attr_reader') do
  it("returns the details of a member") do
    test_member = Member.new("Bill", "Smith", "23")
    expect(test_member.first()).to(eq("Bill"))
    expect(test_member.last()).to(eq("Smith"))
    expect(test_member.phone()).to(eq("23"))
  end
end


  describe('.all') do
  it("show all of the members that have been added") do
    test_member = Member.new("Bill", "Smith", "nine").save
    expect(Member.all()).to(eq(test_member))
  end
end

  describe('#save') do
  it("saves the member to the group of members") do
    test_member = Member.new("Bill", "Smith", "23")
    test_member.save
    expect(Member.all()).to(eq([test_member]))
  end
end

  describe('.clear') do
  it("clears the entire group of members") do
    test_member = Member.new("Bill", "Smith", "23").save
    test_member.clear
    expect(Member.all()).to(eq([]))
  end
end

describe('.find') do
  it("returns a member by their id number") do
    test_number = Member.new("Bill", "Smith", "23")
    test_number.save()
    test_number2 = Member.new("Will", "Smyth", "83")
    test_number2.save()
    expect(Member.find(test_number.id())).to(eq(test_number))
  end
end


end
