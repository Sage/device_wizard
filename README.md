# DeviceWizard

Welcome to DeviceWizard!

The super fast, ultra light weight device detection framework.

Because DeviceWizard is not based on any lookup dictionaries it is future proof and does not need updating when new devices come out, and becuase it is not based on any lookup dictionaries it is super fast and small in size.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'device_wizard'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install device_wizard

## Usage

    #create the user agent detector
    detector = DeviceWizard::UserAgentDetector.new
    
    #pass the user agent to the detector
    device_type = detector.get_device_type(user_agent_string)
    
The detected device type will be one of the following:
- **desktop**
- **tablet**
- **mobile**
- **crawler**
- **unknown**

To improve performance in your application when using device detector we recommend that you only check the device type on the first request and either store the result in the session or a cookie to prevent having to recalculate the device type on each request.

## Upcoming Features

- **Browser Detection**: determine the browser the request was sent from (e.g. chrome/ firefox / internet explorer / or safari etc..)
- **OS Detection**: determine the OS and version the request was sent from (e.g. Windows 10 / IOS 9 etc..)

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/device_wizard. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

