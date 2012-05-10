require 'faraday'
require 'multi_json'
require 'tumblr-v2-api/error/client_error'
require 'tumblr-v2-api/error/unauthorized'

module TumblrV2Api
  module Response
    class RaiseClientError < Faraday::Response::Middleware

      def on_complete(env)

        json = MultiJson.load(env[:body])
        status = json['meta']['status'].to_i rescue nil

        case status
        when 200..201
          #Do nothing
          return
        when 401
          raise TumblrV2Api::Error::Unauthorized.new(error_body(env[:body]), env[:response_headers])
        else
          raise TumblrV2Api::Error::ClientError.new("Failed to get response",{})
        end
      end

    private

      def error_body(body)
        if body.nil?
          ''
        elsif body['error']
          body['error']
        elsif body['errors']
          first = Array(body['errors']).first
          if first.kind_of?(Hash)
            first['message'].chomp
          else
            first.chomp
          end
        end
      end

    end
  end
end
