# DeviceWizard

[![Build Status](https://travis-ci.org/Sage/device_wizard.svg?branch=master)](https://travis-ci.org/Sage/device_wizard)
[![Maintainability](https://api.codeclimate.com/v1/badges/f0d6439302f953419f93/maintainability)](https://codeclimate.com/github/Sage/device_wizard/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/f0d6439302f953419f93/test_coverage)](https://codeclimate.com/github/Sage/device_wizard/test_coverage)
[![Gem Version](https://badge.fury.io/rb/device_wizard.svg)](https://badge.fury.io/rb/device_wizard)

Welcome to DeviceWizard!

The super fast, ultra light weight device detection framework.

Because DeviceWizard is not based on any lookup dictionaries it is future proof and does not need updating when new devices come out, and because it's not based on any lookup dictionaries it is super fast and small in size.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'device_wizard'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install device_wizard
```

## Usage

**Identify All Details**

```ruby
#create the user agent detector
detector = DeviceWizard::UserAgentDetector.new

#pass the user agent to the detector
details = detector.get_details(user_agent)
```

The detected details will return the following:
- **Type** This is the device type of the request [mobile/tablet/desktop etc]
- **Browser** This is the browser of the request {name, version}

```ruby
browser = details.browser

browser_name = details.browser.name

browser_version = details.browser.version
```

- **OS** This is the operating system of the request {name, type, version}

```ruby
os = details.os

os_name = details.os.name

os_type = details.os.type

os_version = details.os.version
```


**Identify Device Type**

```ruby
#create the user agent detector
detector = DeviceWizard::UserAgentDetector.new

#pass the user agent to the detector
device_type = detector.get_device_type(user_agent_string)
```

The detected device type will be one of the following:
- **desktop**
- **tablet**
- **mobile**
- **crawler**
- **unknown**

To improve performance in your application when using device detector we recommend that you only check the device type on the first request and either store the result in the session or a cookie to prevent having to recalculate the device type on each request.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sage/device_wizard. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

This gem is available as open source under the terms of the
[MIT licence](LICENSE).

Copyright (c) 2018 Sage Group Plc. All rights reserved.
