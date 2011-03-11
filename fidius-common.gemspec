# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require "fidius-common/version"

Gem::Specification.new do |s|
  s.name        = "FIDIUS common libraries"
  s.version     = FIDIUS::Common::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Dominik Menke"]
  s.email       = ["dmke+fidicom@tzi.org"]
  s.homepage    = ""
  s.summary     = "Common useful libraries and methods for the FIDIUS C&C server, the FIDIUS 'architecture' and maybe other components."
  s.description = s.summary + "\n\nThese gem and its classes/modules/methods are meant to run stand-alone, e.g. in non-FIDIUS components."

  s.rubyforge_project = ""

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
