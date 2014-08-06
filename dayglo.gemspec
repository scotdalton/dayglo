$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'dayglo/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'dayglo'
  s.version     = Dayglo::VERSION
  s.authors     = ['Scot Dalton']
  s.email       = ['scotdalton@gmail.com']
  s.homepage    = 'https://github.com/scotdalton/dayglow'
  s.summary     = 'Data structures and algorithms implemented in Ruby'
  s.description = 'Library that implements some data structures and algorithms implemented in Ruby'
  s.license     = 'MIT'

  s.files = Dir['lib/**/*'] + ['LICENSE', 'README.md']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'require_all', '~> 1.3.0'

  s.add_development_dependency 'rake', '~> 10.3.0'
  s.add_development_dependency 'rspec', '~> 3.0.0'
end
