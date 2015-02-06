# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'audio_dicer/version'

Gem::Specification.new do |spec|
  spec.name          = "audio_dicer"
  spec.version       = AudioDicer::VERSION
  spec.authors       = ["mikeycgto"]
  spec.email         = ["mikeycgto@gmail.com"]
  spec.summary       = %q{DSL to convert videos into a set of tagged MP3s}
  spec.description   = %q{With this simple DSL, convert video files into one or more tagged MP3s}
  spec.homepage      = "http://github.com/mikeycgto/audio_dicer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
