# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'opulent/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "opulent-rails"
  spec.version       = Opulent::Rails::VERSION
  spec.authors       = ["Alex Grozav"]
  spec.email         = ["alex@grozav.com"]

  spec.summary       = %q{Intelligent Templating Engine for Creative Web Developers.}
  spec.description   = %q{Opulent is an intelligent Templating Engine created to speed up web development through fast rendering and custom web component definitions.}
  spec.homepage      = "http://opulent.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency "opulent"
end
