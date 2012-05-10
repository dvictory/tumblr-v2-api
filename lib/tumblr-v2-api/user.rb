require 'tumblr-v2-api/config'
require 'tumblr-v2-api/request'
require 'tumblr-v2-api/connection'
require 'tumblr-v2-api/authenticatable'

module TumblrV2Api
  class User

    include TumblrV2Api::Connection
    include TumblrV2Api::Request
    include TumblrV2Api::Authenticatable

    attr_accessor *Config::VALID_OPTIONS_KEYS

    def initialize(attrs={})
      attrs = TumblrV2Api.options.merge(attrs)
      Config::VALID_OPTIONS_KEYS.each do |key|
        instance_variable_set("@#{key}".to_sym, attrs[key])

      end
    end


    def info(options={})
        status = post("/v2/user/info", options)
    end
    #returns an array of posts objects
    def likes(options={})
      likes = post("/v2/user/likes", options)

      likes.body["response"]["liked_posts"].map do |post|
          TumblrV2Api::Post.new(post)
      end
    end

  end
end