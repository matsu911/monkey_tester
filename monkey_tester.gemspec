# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'monkey_tester/version'

Gem::Specification.new do |spec|
  spec.name          = "monkey_tester"
  spec.version       = MonkeyTester::VERSION
  spec.authors       = ["Shigeaki Matsumura"]
  spec.email         = ["matsu911@gmail.com"]
  spec.summary       = %q{Web site mokey test library in ruby}
  spec.description   = %q{MonkeyTester is a web site mokey test library in ruby.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'poltergeist', '~> 1.6.0'
  spec.add_dependency 'capybara', '~> 2.4.4'
  
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
