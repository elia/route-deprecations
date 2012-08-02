# RouteDeprecations

Ever tried to migrate a legacy rails app that featured the dreaded _catch-all_ route?

```ruby
map.connect ':controller/:action' # ouch!
```

Well with this gem it can be transformed to this:

```ruby
map.connect ':controller/:action', :deprecated => true
```

obtaining nice deprecation messages (of course you can use `:deprecated => true` on any route you want)!

**protip:** [setup exception notifier](https://gist.github.com/c0eb3b5015d919e909a2) to send you a mail each time a deprecation  is raised in production)



## Installation

Add this line to your application's Gemfile (if you don't use bundler on rails 2 [setup it now](http://gembundler.com/rails23.html)):

    gem 'route-deprecations'


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
