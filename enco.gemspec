# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "enco/version"

Gem::Specification.new do |s|
  s.name        = "enco"
  s.version     = Enco::VERSION
  s.authors     = ["Alexander Paramonov"]
  s.email       = ["alexander.n.paramonov@gmail.com"]
  s.homepage    = "http://github.com/AlexParamonov/enco"
  s.summary     = %q{Push related objects to a queue for delayed save}
  s.description = %q{Enco allows to push related objects to an object's queue for delayed save, that will triggered on object#save. In this case object wil store all related information on its save.}

  s.rubyforge_project = "enco"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec", ">= 2.6"
  s.add_development_dependency "rake"
  s.add_runtime_dependency "rchardet19"
  #s.add_runtime_dependency "activesupport"
end
