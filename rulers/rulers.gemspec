# frozen_string_literal: true

require_relative "lib/rulers/version"

Gem::Specification.new do |spec|
  spec.name = "rulers"
  spec.version = Rulers::VERSION
  spec.authors = ["Vlad Saraev"]
  spec.email = ["vlad.saraev@cultureamp.com"]

  spec.summary = "A Rack-based Web Framework"
  spec.description = "A Rack-based Web Framework with extra awesome."
  spec.homepage = "https://github.com/vladL2C/rebuilding_rails"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "#{spec.homepage}/rulers"
  spec.metadata["changelog_uri"] = "#{spec.homepage}/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_runtime_dependency "rack"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "standard"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
