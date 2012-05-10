require 'tumblr-v2-api/error/client_error'

module TumblrV2Api
  # Raised when Tumblr returns the HTTP status code 401
  class Error::Unauthorized < TumblrV2Api::Error::ClientError
  end
end
