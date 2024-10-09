require_relative 'lib/graphql/models_connect/version'

Gem::Specification.new do |spec|
  spec.name = 'graphql-models_connect'
  spec.version = GraphQL::ModelsConnect::VERSION
  spec.authors = ['Moku S.r.l.', 'Riccardo Agatea']
  spec.email = ['info@moku.io']
  spec.license = 'MIT'

  spec.summary = 'Directly link GraphQL types to underlying models.'
  spec.description = 'Directly link GraphQL types to underlying models.'
  spec.homepage = 'https://github.com/moku-io/graphql-models_connect'
  spec.required_ruby_version = '>= 3.0.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/moku-io/graphql-models_connect'
  spec.metadata['changelog_uri'] = 'https://github.com/moku-io/graphql-models_connect/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir File.expand_path(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'
  spec.add_dependency 'graphql', '~> 2.0'
end
