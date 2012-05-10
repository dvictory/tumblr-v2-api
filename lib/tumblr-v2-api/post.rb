require 'tumblr-v2-api/base'
require 'tumblr-v2-api/photo'

module TumblrV2Api
  class Post < TumblrV2Api::Base
    lazy_attr_reader :blog_name,:id,:post_url,:type,:timestamp,:date,:format,:reblog_key,:tags,:bookmarklet,:mobile,:source_url,:source_title,
                     :total_post,:title,:body,:text,:source,:url,:description,:dialogue,:caption,:player,:plays,:asking_name,:asking_url,:question,:answer

    # @note Must include entities in your request for this method to work
    # @return [Array<Tumblr::Entity::UserMention>]
    def photos

      photos_array=[]
      if !@attrs['photos'].nil?
        Array(@attrs['photos']).each do |photo|
          photos_array << TumblrV2Api::Photo.new(photo)

        end
        photos_array
      else
        nil
      end
    end


  end
end