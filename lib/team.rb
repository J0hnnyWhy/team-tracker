class Team

  attr_reader(:name)
  @@teams = []
  define_method(:initialize) do |name|
    @name = name
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
end
