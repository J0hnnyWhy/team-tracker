class Team

  attr_reader(:name, :players)
  @@teams = []

  define_method(:initialize) do |name|
    @name = name
    @players = []
  end

  define_singleton_method(:all) do
    @@teams
  end

  define_method(:save) do
    @@teams.push(self)
  end

  define_singleton_method(:clear) do
    @@teams = []
  end

  define_method(:add_member) do |member|
    @players.push(member)
  end

  define_singleton_method(:find) do |identification|
    found_team = nil
    @@teams.each do |team|
      if team.name==identification
        found_team = team
      end
    end
    found_team
  end
end
