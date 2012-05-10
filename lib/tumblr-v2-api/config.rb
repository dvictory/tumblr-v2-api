require 'tumblr-v2-api/version'

module TumblrV2Api
  # Defines constants and methods related to configuration
  module Config

    # The HTTP connection adapter that will be used to connect if none is set
    DEFAULT_ADAPTER = :net_http

    # The Faraday connection options if none is set
    DEFAULT_CONNECTION_OPTIONS = {}

    # The consumer key if none is set
    DEFAULT_CONSUMER_KEY = nil


    # The consumer secret if none is set
    DEFAULT_CONSUMER_SECRET = nil


    DEFAULT_ENDPOINT = 'http://api.tumblr.com'

    # The oauth token if none is set
    DEFAULT_OAUTH_TOKEN = nil

    # The oauth token secret if none is set
    DEFAULT_OAUTH_TOKEN_SECRET = nil

    DEFAULT_BLOG_ID = ""


    # The value sent in the 'User-Agent' header if none is set
    DEFAULT_USER_AGENT = "Tumblr V2 API Ruby Gem #{TumblrV2Api::Version}"

    # An array of valid keys in the options hash when configuring a {TumblrV2Api::Client}
    VALID_OPTIONS_KEYS = [
      :adapter,
      :connection_options,
      :consumer_key,
      :consumer_secret,
      :endpoint,
      :oauth_token,
      :oauth_token_secret,
      :user_agent,
      :blog_id

    ]

    attr_accessor *VALID_OPTIONS_KEYS

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
      self
    end

    # Create a hash of options and their values
    def options
      options = {}
      VALID_OPTIONS_KEYS.each{|k| options[k] = send(k)}
      options
    end

    # Reset all configuration options to defaults
    def reset
      self.adapter            = DEFAULT_ADAPTER
      self.connection_options = DEFAULT_CONNECTION_OPTIONS
      self.consumer_key       = DEFAULT_CONSUMER_KEY
      self.consumer_secret    = DEFAULT_CONSUMER_SECRET
      self.endpoint           = DEFAULT_ENDPOINT
      self.oauth_token        = DEFAULT_OAUTH_TOKEN
      self.oauth_token_secret = DEFAULT_OAUTH_TOKEN_SECRET
      self.user_agent         = DEFAULT_USER_AGENT
      self.blog_id            = DEFAULT_BLOG_ID
      self
    end

  end
end
