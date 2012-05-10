# TumblrV2Api

This is based off the twitter api found at - https://github.com/jnunemaker/twitter. Thanks to all his hard work.

## Installation

Add this line to your application's Gemfile:

    gem 'tumblr-v2-api', :git=>"git://github.com/dvictory/tumblr-v2-api.git",:require=>"tumblr_v2_api"

Add this to an initializer:

    TumblrV2Api.configure do |config|
        config.consumer_key = YOUR_CONSUMER_KEY
        config.consumer_secret = YOUR_CONSUMER_SECRET
        config.oauth_token = YOUR_OAUTH_TOKEN
        config.oauth_token_secret = YOUR_OAUTH_TOKEN_SECRET
    end

Note: Your consumer key and secret you get when you create an app on Tumblr.  To get the oauth token and secret you need to get a request token
and secret and then use those to get the access token and secret.

And then execute:

    $ bundle

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
