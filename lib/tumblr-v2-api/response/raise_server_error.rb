require 'faraday'
require 'tumblr-v2-api/error/bad_gateway'
require 'tumblr-v2-api/error/internal_server_error'
require 'tumblr-v2-api/error/service_unavailable'

module TumblrV2Api
  module Response
    class RaiseServerError < Faraday::Response::Middleware

      def on_complete(env)
        case env[:status].to_i
        when 500
          raise TumblrV2Api::Error::InternalServerError.new("Something is technically wrong.", env[:response_headers])
        when 502
          raise TumblrV2Api::Error::BadGateway.new("Tumblr is down or being upgraded.", env[:response_headers])
        when 503
          raise TumblrV2Api::Error::ServiceUnavailable.new("(__-){ Tumblr is over capacity.", env[:response_headers])
        end
      end

    end
  end
end
