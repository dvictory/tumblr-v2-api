require 'tumblr-v2-api/base'
module TumblrV2Api
  class AltSize < TumblrV2Api::Base
    lazy_attr_reader :width,:height,:url
  end
end