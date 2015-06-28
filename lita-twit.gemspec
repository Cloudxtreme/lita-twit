Gem::Specification.new do |spec|
  spec.name          = "lita-twit"
  spec.version       = "0.0.1"
  spec.authors       = ["Jivko Georgiev"]
  spec.email         = ["jivkobg@gmail.com"]
  spec.description   = "Twitter handler"
  spec.summary       = "Twitter api handler"
  spec.homepage      = "https://github.com/jivko/lita-twit"
  spec.license       = "MIT License (MIT)"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", "~> 4.4"
  spec.add_runtime_dependency "twitter", '~> 5.14', '>= 5.14.0'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry-byebug", '~> 0'
  spec.add_development_dependency "rake", '~> 0'
  spec.add_development_dependency "rack-test", '~> 0'
  spec.add_development_dependency "rspec",  '~> 3.0', '>= 3.0.0'
end
