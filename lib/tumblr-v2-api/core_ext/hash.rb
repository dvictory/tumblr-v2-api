class Hash

  # Merges self with another hash, recursively
  #
  # @param hash [Hash] The hash to merge
  # @return [Hash]
  def deep_merge(hash)
    target = self.dup
    hash.keys.each do |key|
      if hash[key].is_a?(Hash) && self[key].is_a?(Hash)
        target[key] = target[key].deep_merge(hash[key])
        next
      end
      target[key] = hash[key]
    end
    target
  end


  # Take a single list ID or slug and merge it into self with the correct key
  #
  # @param list_id_or_slug [Integer, String] A Tumblr list ID or slug.
  # @return [Hash]
  def merge_list!(list_id_or_screen_name)
    case list_id_or_screen_name
    when Integer
      self[:list_id] = list_id_or_screen_name
    when String
      self[:slug] = list_id_or_screen_name
    end
    self
  end

end
