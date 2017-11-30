lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/slarin/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruboty-slarin'
  spec.version       = Ruboty::Slarin::VERSION
  spec.authors       = ['SHIOYA, Hiromu']
  spec.email         = ['kwappa.856@gmail.com']

  spec.summary       = "Slarin Handler"
  spec.description   = spec.summary
  spec.homepage      = 'https://kwappa.github.io'
  spec.license       = 'MIT'

  spec.add_development_dependency 'bundler'
  spec.add_dependency 'pry-byebug'
end
