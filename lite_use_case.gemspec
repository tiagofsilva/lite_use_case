Gem::Specification.new do |spec|
  spec.name    = "lite_use_case"
  spec.version = "1.0"

  spec.author      = "Guava Software"
  spec.email       = "tiago@guava.com"
  spec.description = ""
  spec.summary     = "Simple interactor or use case implementation"
  spec.homepage    = ""
  spec.license     = "MIT"

  spec.files      = `git ls-files`.split($/)
  spec.test_files = spec.files.grep(/^spec/)

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.3"
end
