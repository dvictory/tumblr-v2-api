require 'faraday'
require 'tumblr-v2-api/core_ext/hash'
#require 'twitter/request/gateway'
#require 'twitter/request/multipart_with_file'
#require 'twitter/request/phoenix'
require 'tumblr-v2-api/request/oauth'
require 'tumblr-v2-api/response/parse_json'
require 'tumblr-v2-api/response/raise_client_error'
require 'tumblr-v2-api/response/raise_server_error'

module TumblrV2Api
  module Connection
  private

    # Returns a Faraday::Connection object
    #
    # @param options [Hash] A hash of options
    # @return [Faraday::Connection]
    def connection(options={})
      default_options = {
        :headers => {
          :accept => 'application/json',
          :user_agent => user_agent,
        },
        :ssl => {:verify => false},
        :url => options.fetch(:endpoint, endpoint),
      }
      @connection ||=Faraday.new(default_options.deep_merge(connection_options)) do |builder|
        builder.use TumblrV2Api::Request::TumblrV2ApiOAuth, credentials if credentials?
        builder.use Faraday::Request::UrlEncoded
        builder.use TumblrV2Api::Response::ParseJson
        builder.use TumblrV2Api::Response::RaiseClientError
        builder.use TumblrV2Api::Response::RaiseServerError
        builder.response :logger
        builder.adapter(adapter)
      end
    end
  end
end
