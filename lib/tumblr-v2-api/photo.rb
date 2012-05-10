require 'tumblr-v2-api/base'
require 'tumblr-v2-api/alt_size'

module TumblrV2Api
  class Photo < TumblrV2Api::Base
    lazy_attr_reader :caption

    def alt_sizes
      sizes_array=[]
      if !@attrs['alt_sizes'].nil?
        Array(@attrs['alt_sizes']).each do |photo|
          sizes_array << TumblrV2Api::AltSize.new(photo)
        end
        sizes_array
      else
        nil
      end
    end
  end

end