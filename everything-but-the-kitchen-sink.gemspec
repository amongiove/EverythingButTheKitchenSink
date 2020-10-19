
Gem::Specification.new do |s|
  s.name        = 'everything-but-the-kitchen-sink'
  s.version     = '0.1.0'
  s.date        = '2020-10-16'
  s.summary     = "Everything but the Kitchen Sink"
  s.description = "Provides recipes based on ingredients you have."
  s.authors     = ["Amanda Mongiove"]
  s.email       = 'amandamongiove@gmail.com'
  s.files       = ["lib/recipe_cli/cli.rb", "lib/recipe_cli/recipe.rb", "lib/recipe_cli/spoonacular_api.rb", "lib/recipe_cli/transform_data.rb", "config/environment.rb"]
  s.homepage    = 'http://rubygems.org/gems/everything-but-the-kitchen-sink'
  s.license     = 'MIT'
  s.executables << 'everythingbut'

  s.add_development_dependency "rspec", "~> 3.0"
  s.add_development_dependency "rest-client", "~> 2.1"
  s.add_development_dependency "json", "~> 2.3"
end
