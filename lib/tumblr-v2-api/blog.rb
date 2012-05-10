require 'tumblr-v2-api/config'
require 'tumblr-v2-api/request'
require 'tumblr-v2-api/connection'
require 'tumblr-v2-api/post'
require 'tumblr-v2-api/base'
require 'tumblr-v2-api/authenticatable'
require 'tumblr-v2-api/blog/post'

module TumblrV2Api
  class Blog < TumblrV2Api::Base

    include TumblrV2Api::Connection
    include TumblrV2Api::Request
    include TumblrV2Api::Authenticatable
    include TumblrV2Api::Blog::Post

    attr_accessor *Config::VALID_OPTIONS_KEYS
    info_reader :title,:posts,:name,:url,:updated,:description,:ask,:ask_anon,:likes

    alias :blog_name :blog_id

    def initialize(attrs={})
      attrs = TumblrV2Api.options.merge(attrs)
      Config::VALID_OPTIONS_KEYS.each do |key|
        instance_variable_set("@#{key}".to_sym, attrs[key])

      end
    end

    def info(options={})
      options[:api_key] = consumer_key
      status = get("/v2/blog/#{blog_id}/info", options)

      status.body["response"]["blog"].each do |key,value|
          instance_variable_set("@#{key}".to_sym, value)
      end

      status.body["response"]["blog"]
    end

    def followers(options={})
      status = get("/v2/blog/#{blog_id}/followers", options)
      status.body["response"]
    end

    def avatar(size="")
      "#{endpoint}/v2/blog/#{blog_id}/avatar/#{size}"
    end

    #options
    #
    #
    # limit - limits number returned
    def posts(options={})
      if options.has_key? :type
        type = options[:type]
      else
        type = nil
      end
      options[:api_key] = consumer_key
      status = get("/v2/blog/#{blog_id}/posts#{type.nil? ? "":"/#{type}"}", options)

      status.body["response"]["posts"].map do |post|
        TumblrV2Api::Post.new(post)
      end
    end

    def queue(options={})

      status = get("/v2/blog/#{blog_id}/posts/queue", options)
      status.body["response"]["posts"].map do |post|
        TumblrV2Api::Post.new(post)
      end
    end

    def draft(options={})
      status = get("/v2/blog/#{blog_id}/posts/draft", options)
      status.body["response"]["posts"].map do |post|
        TumblrV2Api::Post.new(post)
      end
    end

    def submission(options={})
      status = get("/v2/blog/#{blog_id}/posts/submission", options)
      status.body["response"]["posts"].map do |post|
        TumblrV2Api::Post.new(post)
      end
    end


  end
end