# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'bootstar/version'

Gem::Specification.new do |s|
  s.name        = 'bootstar'
  s.version     = Bootstar::VERSION
  s.authors     = ['Nicola Brisotto', 'Giovanni Cappellotto', 'Matteo Centenaro', 'Eugenio Depalo', 'Matteo Depalo', 'Francesco Tartaggia']
  s.email       = ['nicolabrisotto@gmail.com', 'potomak84@gmail.com', 'bugant@gmail.com', 'eugeniodepalo@gmail.com', 'matteodepalo@gmail.com', 'francesco.tartaggia@gmail.com']
  s.homepage    = 'http://github.com/hackatron/bootstar'
  s.summary     = %q{A tool to bootstrap your service oriented app}
  s.description = %q{Bootstar is a tool to bootstrap your service oriented app.}

  s.rubyforge_project = 'bootstar'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'thor'

  # specify any dependencies here; for example:
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'debugger'
  # s.add_runtime_dependency "rest-client"
end
