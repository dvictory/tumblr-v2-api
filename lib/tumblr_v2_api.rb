require "tumblr-v2-api/version"
require 'tumblr-v2-api/blog'
require 'tumblr-v2-api/user'
require 'tumblr-v2-api/config'

module TumblrV2Api
  extend Config
  class << self

    def new(options={})
      TumblrV2Api::Blog.new(options)
    end

    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end
  end
end
