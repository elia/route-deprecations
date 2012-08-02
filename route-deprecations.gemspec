# coding: utf-8
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'route-deprecations/version'

Gem::Specification.new do |gem|
  gem.authors       = ['Elia Schito']
  gem.email         = ['elia@schito.me']
  gem.description   = %q{Adds ability to deprecate routes from config routes}
  gem.summary       = %q{Deprecate your routes with ease!}
  gem.homepage      = 'http://elia.github.com/route-deprecations'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "route-deprecations"
  gem.require_paths = ['lib']
  gem.version       = RouteDeprecations::VERSION

  gem.add_dependency 'rails', '~> 2.3.8'
end
