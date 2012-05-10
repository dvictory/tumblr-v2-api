require 'tumblr-v2-api/error/server_error'

module TumblrV2Api
  # Raised when Tumblr returns the HTTP status code 502
  class Error::InternalServerError < TumblrV2Api::Error::ServerError
  end
end
