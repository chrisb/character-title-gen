# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'character_titles/version'

Gem::Specification.new do |spec|
  spec.name          = 'character_titles'
  spec.version       = CharacterTitles::VERSION
  spec.authors       = ['Chris Bielinski']
  spec.email         = ['chris@shadow.io']

  spec.summary       = 'Generates ominous-sounding names for characters'
  spec.description   = 'Generates ominous-sounding names for characters'
  spec.homepage      = 'https://github.com/chrisb/character_titles'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
end
