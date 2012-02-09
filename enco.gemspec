# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "enco/version"

Gem::Specification.new do |s|
  s.name        = "enco"
  s.version     = Enco::VERSION
  s.authors     = ["Alexander Paramonov"]
  s.email       = ["alexander.n.paramonov@gmail.com"]
  s.homepage    = "http://github.com/AlexParamonov/enco"
  s.summary     = %q{Enco will convert any string to utf-8, based on original string encoding.}
  s.description = %q{Enco can convert any string to utf-8, based on it original encoding. 
Converting string to utf-8 never was so simple as with Enco!}

  s.rubyforge_project = "enco"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec", ">= 2.6"
  s.add_development_dependency "rake"
  s.add_runtime_dependency "charlock_holmes"
end
