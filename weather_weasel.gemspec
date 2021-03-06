# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'weather_weasel/version'

Gem::Specification.new do |gem|
  gem.name          = "weather_weasel"
  gem.version       = WeatherWeasel::VERSION
  gem.authors       = ["Elizabeth Tabler, Duncan Miller, Michael LaPeter"]
  gem.email         = ["opensourceportland@gmail.com"]
  gem.description   = "Wrapper for the Wunderground API"
  gem.summary       = "A location-centric system for consuming the Wunderground API"
  gem.homepage      = "https://github.com/OpenSourcePortland/weather_weasel"  
  gem.add_dependency 'httparty', ">= 0.10.2"
  gem.add_dependency 'rspec'
  gem.add_dependency 'vcr'
  gem.add_dependency 'simplecov'
  gem.add_dependency 'fakeweb'


  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
