# MonkeyTester

MonkeyTester is a mokey test library in ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'monkey_tester'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install monkey_tester

## Usage

Sample script

```ruby
require 'monkey_tester'

MonkeyTester.setup!

walker = MonkeyTester::RandomWalker.new(
  url: 'http://localhost/',
  login: {
    url: 'http://localhost/login',
    id: {label: 'Login ID', value: 'test_id'},
    password: {label: 'Password', value: 'test_pass'},
    button: {label: 'Login'},
  },
  debug: true,
)
walker.walk
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/monkey_tester/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
