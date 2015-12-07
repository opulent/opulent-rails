# Opulent::Rails

Opulent is an Intelligent Web Templating Engine created for extremely fast and efficient Web Development. Based on the idea of lightweight and reusable Web Components, Opulent greatly increases your development speed for any project.

Opulent has a beautiful, minimalistic syntax: no tags, indentation based, optional brackets, inline text, inline children and in page definitions.

[Read more](https://github.com/opulent/opulent)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'opulent-rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install opulent-rails

## Usage

First of all, create `layout.op` and `index.op` inside of your views folder.

Render your views with Opulent inside of Rails by simply using:

```ruby
get '/' do
  opulent :index
end
```

You can specify the layout file and pass a block into the rendered page the following way:

```ruby
get '/' do
  opulent(:index, layout: :layout){}
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/opulent-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
