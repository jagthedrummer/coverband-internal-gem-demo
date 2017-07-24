$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "interal_full_mountable_gem/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "interal_full_mountable_gem"
  s.version     = InteralFullMountableGem::VERSION
  s.authors     = ["Jeremy Green"]
  s.email       = ["jeremy@octolabs.com"]
  s.homepage    = ""
  s.summary     = ""
  s.description = ""
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.7"

  s.add_development_dependency "sqlite3"
end
