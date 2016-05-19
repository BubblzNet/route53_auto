# Route53Auto

Welcome to Route53Auto.
The purpose of this gem is to automatically aliase your dns with your domain name with AWS.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'route53_auto'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install route53_auto

## Configuration

**First Method**

Add as environment variables:

`EC2_AMAZON_REGION = 'your-region-1'`

`EC2_AMAZON_ACCESS_KEY = 'your-access-key'`

`EC2_AMAZON_SECRET_ACCESS = 'your-secret-access-key'`


**Second method**

If you have your credentials stored here `~/.aws/credentials`
create a profile called `ec2`

And prototype it like this ->
```
[ec2]
aws_access_key_id = youraccesskey
aws_secret_access_key = yoursecretaccesskey
```
**If your ec2 server is located somewhere else than `eu-west-1`, please fill up `EC2_AMAZON_REGION` variable**


## Usage

Make sure you have auto-scaling disabled on your ec2 instance.


Use your instance-id and your domaine name to link `route = Route53.new('i-yourid', 'your.domain-name.com')`

It will aliase your dns with your domaine name


### Pro-Tips

You can also use any route53-client command you want by using `route.client` variable.
Usable methods are here -> http://docs.aws.amazon.com/sdkforruby/api/Aws/Route53/Client.html

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Kokiwi/route53_auto. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

