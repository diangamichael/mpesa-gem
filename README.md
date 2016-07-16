MPesa Ruby Gem
==============

Basically it's a gem that makes it easy to integrate your app with the new
[M-PESA platform dubbed G2][mpesa-api] (for M-PESA 2nd generation platform). It
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


Development
-----------

After checking out the repo, to install this gem onto your local machine:

    $ bundle install

To get an interactive prompt that will allow you to experiment:

    $ bundle console


Testing
-------

To run tests, call;

    $ bundle exec rspec spec


License
-------

[Job King'ori Maina](http://kingori.co/) © 2016. The MIT License bundled therein
is a permissive license that is short and to the point. It lets people do
anything they want as long as they provide attribution and waive liability. You
can [learn more about it here][mit-license].

[changelog]: https://raw.githubusercontent.com/itsmrwave/mpesa-gem/master/CHANGELOG.md
[mit-license]: http://choosealicense.com/licenses/mit
[mpesa-api]: http://www.safaricom.co.ke/business/corporate/m-pesa-payments-services/m-pesa-api
[releases]: https://github.com/itsmrwave/mpesa-gem/releases
[rubydoc-mpesa]: http://rubydoc.info/gems/mpesa
[rubygems-mpesa]: http://rubygems.org/gems/mpesa
