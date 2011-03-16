# These changes are necessary to extend json encoding & decoding
# for ruby-symbols. Tricky parts are symbols in Arrays or Hashes.

require 'active_support'
require 'active_support/json'

# Part of the JSON Symbol Addon.
# @see FIDIUS::Common.install_json_symbol_addon
class Symbol
  # Encodes symbols as +String+, prefixed with ":".
  # 
  # @param [Hash] options  Ingnored.
  # @return [String]  The converted +Symbol+.
  def as_json(options = nil)
    ":" + to_s
  end
end

# Part of the JSON Symbol Addon.
# @see FIDIUS::Common.install_json_symbol_addon
class Hash
  # JSON-encodes +self+.
  #
  # @param [Hash] options  An options-hash. Keys maybe +:only+, +:exept+
  #                        or +:encoder+.
  # @return [String]  The JSON-encoded string of +self+.
  def as_json(options = nil)
    # create a subset of the hash by applying :only or :except
    subset = if options
      if attrs = options[:only]
        slice(*Array.wrap(attrs))
      elsif attrs = options[:except]
        except(*Array.wrap(attrs))
      else
        self
      end
    else
      self
    end

    # use encoder as a proxy to call as_json on all values in the subset, to protect from circular references
    encoder = options && options[:encoder] || ActiveSupport::JSON::Encoding::Encoder.new(options)
    
    # FIDIUS changed here to from k.to_s to k.as_json to decode strings with : as symbols
    pairs = subset.map do |k, v|
      [k.as_json, encoder.as_json(v)]
    end
    result = if self.is_a?(ActiveSupport::OrderedHash)
      ActiveSupport::OrderedHash.new
    else
      Hash.new
    end
    pairs.inject(result) do |hash, pair|
      hash[pair.first] = pair.last; hash
    end
  end

  # Converts each key to a symbol, if the key is a +String+ and its
  # first character is a +:+.
  #
  # @return [Hash]  The converted hash.
  def symbolize_keys_if_needed
    to_add = Hash.new
    self.each_pair do |k,v|
      if v.respond_to?("symbolize_keys_if_needed")
        v.symbolize_keys_if_needed
      end
      if k[0] == ":"
        self.delete(k)
        to_add[k[1..-1].to_sym] = v
      end
    end
    to_add.each_pair do |k,v|
      self[k] = v
    end
  end
end

# Part of the JSON Symbol Addon.
# @see FIDIUS::Common.install_json_symbol_addon
class Array
  # [1,":aa",:asa].symbolize_keys_if_needed
  #  => [1, :aa, :asa] 
  def symbolize_keys_if_needed
    self.each_with_index do |e,i|
      e.symbolize_keys_if_needed if e.respond_to?("symbolize_keys_if_needed")
      if self[i].to_s[0] == ":"
        self[i] = e[1..-1].to_sym
      end
    end
  end
end

# Part of the JSON Symbol Addon.
# @see FIDIUS::Common.install_json_symbol_addon
# @see http://rubyonrails.org
# @see http://api.rubyonrails.org
module ActiveSupport
  # ActiveSupports JSON module
  # @see http://api.rubyonrails.org/classes/ActiveSupport/JSON.html
  module JSON
    # Parses a JSON string or IO and convert it into an object. Any
    # strings of that object will be converted, if they are prefixed
    # with a +:+.
    #
    # @param [String, IO] json  Any JSON formatted object.
    # @return [Object]  The converted object.
    def self.decode(json)
      set_default_backend unless defined?(@backend)
      result = @backend.decode(json)
      result.symbolize_keys_if_needed
    end
  end
end
