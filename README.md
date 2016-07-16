MPesa Ruby Gem
==============

[![Build Status](https://travis-ci.org/itsmrwave/mpesa-gem.svg?branch=master)](https://travis-ci.org/itsmrwave/mpesa-gem) [![Coverage Status](https://coveralls.io/repos/github/itsmrwave/mpesa-gem/badge.svg)](https://coveralls.io/github/itsmrwave/mpesa-gem)

Basically it's a gem that makes it easy to integrate your app with the new
[M-PESA platform][mpesa-api] dubbed G2 (for M-PESA 2nd generation platform). It
Handles all the SOAP stuff abstracting any direct interaction with the API
endpoints so that you can focus on what matters. _Building awesome_.

The gem [should be up on RubyGems.org][rubygems-mpesa], it's [accompanying API
reference here][rubydoc-mpesa], the [CHANGELOG here][changelog] and [all the
releases here][releases].


Installation
------------

Add this line to your application's Gemfile:

    gem 'mpesa'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install mpesa


Issues
------

[Bug reports][issues] and [pull requests][pull-requests] are welcome on GitHub
at [github.com/itsmrwave/mpesa-gem][repositories]. This project is intended to
be a safe, welcoming space for collaboration, and [contributors][contributors]
are expected to adhere to the [Contributor Code of Conduct][code-of-conduct].


Development
-----------

After checking out the repo, run this to set up your local machine:

    $ bin/setup

To get an interactive prompt that will allow you to experiment:

    $ bin/console

See [recommended contributing process][contributing].


Documentation
-------------

You may start up a local documentation server at `http://0.0.0.0:8808` to
preview the gem API documentation locally. Just call:

    $ bundle exec yard server --reload

The result should be similar as to what will eventually be available as [the
RubyDoc API reference][rubydoc-mpesa].


Testing
-------

To run tests, call:

    $ bundle exec rspec spec


License
-------

[Job King'ori Maina](http://kingori.co/) © 2016. The MIT License bundled therein
is a permissive license that is short and to the point. It lets people do
anything they want as long as they provide attribution and waive liability. You
can [learn more about it here][mit-license].

[changelog]: https://raw.githubusercontent.com/itsmrwave/mpesa-gem/master/CHANGELOG.md
[code-of-conduct]: https://raw.githubusercontent.com/itsmrwave/mpesa-gem/master/CODE_OF_CONDUCT.md
[contributing]: https://raw.githubusercontent.com/itsmrwave/mpesa-gem/master/CONTRIBUTING.md
[contributors]: https://github.com/itsmrwave/mpesa-gem/graphs/contributors
[issue-new]: https://github.com/itsmrwave/mpesa-gem/issues/new
[issues]: https://github.com/itsmrwave/mpesa-gem/issues
[mit-license]: http://choosealicense.com/licenses/mit
[mpesa-api]: http://www.safaricom.co.ke/business/corporate/m-pesa-payments-services/m-pesa-api
[pull-requests]: https://github.com/itsmrwave/mpesa-gem/pulls
[releases]: https://github.com/itsmrwave/mpesa-gem/releases
[repositories]: https://github.com/itsmrwave/mpesa-gem
[rubydoc-mpesa]: http://rubydoc.info/gems/mpesa
[rubygems-mpesa]: http://rubygems.org/gems/mpesa
