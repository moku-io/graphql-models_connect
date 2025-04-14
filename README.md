# GraphQL Models Connect

A way to directly link GraphQL types with their underlying models.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'graphql-models_connect', '~> 1.0'
```

And then execute:
```bash
$ bundle
```

## Usage

GraphQL Models Connect associates every GraphQL type with a model. By default, the model is assumed to have the same name as the type minus the `Type` suffix, and to be nested under the same module. For a single exception you can explicitly declare the model inside your object type:

```ruby
module Types
  class PokemonType < BaseObject
    model_class Pokemon
    ...
  end
end
```

To change the default behavior of the gem, override the `default_model_class` class method in your base object class:

```ruby
module Types
  class BaseObject < GraphQL::Schema::Object
    def self.default_model_class
      model_name = name
                     .delete_prefix('Types::')
                     .delete_suffix('Type')

      const_get model_name
    end
  end
end
```

The same methods are defined for interfaces.

## Version numbers

GraphQL Models Connect loosely follows [Semantic Versioning](https://semver.org/), with a hard guarantee that breaking changes to the public API will always coincide with an increase to the `MAJOR` number.

Version numbers are in three parts: `MAJOR.MINOR.PATCH`.

- Breaking changes to the public API increment the `MAJOR`. There may also be changes that would otherwise increase the `MINOR` or the `PATCH`.
- Additions, deprecations, and "big" non breaking changes to the public API increment the `MINOR`. There may also be changes that would otherwise increase the `PATCH`.
- Bug fixes and "small" non breaking changes to the public API increment the `PATCH`.

Notice that any feature deprecated by a minor release can be expected to be removed by the next major release.

## Changelog

Full list of changes in [CHANGELOG.md](CHANGELOG.md)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/moku-io/graphql-filters.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
