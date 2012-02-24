# encoding: utf-8
require File.expand_path('../lib/omniauth/getglue/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'omniauth-getglue'
  gem.version     = OmniAuth::GetGlue::VERSION
  gem.homepage    = 'https://github.com/jcbarry/omniauth-getglue'

  gem.author      = 'Jason Barry'
  gem.email       = 'jay@jcbarry.com'
  gem.description = 'GetGlue strategy for OmniAuth 1.0'
  gem.summary     = gem.description

  gem.add_dependency "omniauth-oauth", "~> 1.0"
  gem.add_dependency "nokogiri", "~> 1.5.0"

  gem.add_development_dependency 'rake', '~> 0.9'
  gem.add_development_dependency 'rdiscount', '~> 1.6'
  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'simplecov', '~> 0.5'
  gem.add_development_dependency 'yard', '~> 0.7'
  gem.add_development_dependency 'webmock', '~> 1.7'

  gem.executables = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  gem.files       = `git ls-files`.split("\n")
  gem.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")

  gem.require_paths = ['lib']
end
