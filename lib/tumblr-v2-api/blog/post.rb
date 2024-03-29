module TumblrV2Api
  class Blog < TumblrV2Api::Base
    module Post
      @@standard_post_options  = [:state, :tags, :tweet, :date, :markdown, :slug]

      def edit(options={})
        post("v2/blog/#{blog_name}/post/edit", options)
      end

      #Don't be lazy and create a nice interface
      def reblog(options={})
        post("v2/blog/#{blog_name}/post/reblog", options)
      end

      def delete(id)
        post("v2/blog/#{blog_name}/post/delete", {:id => id})
      end

      def photo(options={})
        valid_opts = @@standard_post_options + [:caption, :link, :data, :source]
        if valid_options(valid_opts, options)
          options[:type] = "photo"
          if (options.has_key?(:data) && options.has_key?(:source))
            raise Exception, "You can only use one parameter, either source or data."
          end
          if options.has_key?(:data)
            #Probably can be refactored
            if options[:data].kind_of?(Array)
              count = 0
              options[:data].each do |filepath|
                options["data[#{count}]"] = File.open(filepath, 'rb').read()
                count += 1
              end
              options.delete(:data)
            else
              options[:data] = File.open(options[:data],'rb').read()
            end
          end
          post("v2/blog/#{blog_name}/post", options)
        end
      end

      def quote(options={})
        valid_opts = @@standard_post_options + [:quote, :source]
        if valid_options(valid_opts, options)
          options[:type] = "quote"
          post("v2/blog/#{blog_name}/post", options)
        end
      end

      def text(options={})
        valid_opts = @@standard_post_options + [:title, :body]
        if valid_options(valid_opts, options)
          options[:type] = "text"
          post("v2/blog/#{blog_name}/post", options)
        end
      end

      def link(options={})
        valid_opts = @@standard_post_options + [:title, :url, :description]
        if valid_options(valid_opts, options)
          options[:type] = "link"
          post("v2/blog/#{blog_name}/post", options)
        end
      end

      def chat(options={})
        valid_opts = @@standard_post_options + [:title, :conversation]
        if valid_options(valid_opts, options)
          options[:type] = "chat"
          post("v2/blog/#{blog_name}/post", options)
        end
      end

      def audio(options={})
        valid_opts = @@standard_post_options + [:data, :caption, :external_url]
        if valid_options(valid_opts, options)
          options[:type] = "audio"
          if (options.has_key?(:data) && options.has_key?(:external_url))
            raise Exception, "You can only use one parameter, either data or external url."
          end
          if(options.has_key?(:data))
            options[:data] = File.open(options[:data],'rb').read()
          end
          post("v2/blog/#{blog_name}/post", options)
        end
      end

      def video(options={})
        valid_opts = @@standard_post_options + [:data, :embed, :caption]
        if valid_options(valid_opts, options)
          options[:type] = "video"
          if (options.has_key?(:data) && options.has_key?(:embed))
            raise Exception, "You can only use one parameter, either data or embed."
          end
          if(options.has_key?(:data))
            options[:data] = File.open(options[:data],'rb').read()
          end
          post("v2/blog/#{blog_name}/post", options)
        end
      end

    end
  end
end