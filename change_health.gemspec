# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'change_health/version'

Gem::Specification.new do |spec|
  spec.name          = "change_health"
  spec.version       = ChangeHealth::VERSION
  spec.authors       = ["Viet.Nguyen"]
  spec.email         = ["viet.nguyen@getcerebral.com"]

  spec.summary       = %q{Write a short summary, because Rubygems requires one.}
  spec.description   = %q{Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/cerebral-inc/changehealth"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec-its", "~> 1.3"
  spec.add_development_dependency "webmock", "~> 3.8"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "simplecov"
  spec.add_runtime_dependency "httparty", "~> 0.18"
  spec.add_runtime_dependency "activesupport", "~> 5.2.4"

end
