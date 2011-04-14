require 'fidius-common/ip-helper'
require 'fidius-common/yamldb'

# FIDIUS Intrusion Detection with Intelligent User Support.
# @see http://fidius.me
module FIDIUS
  # Common used methods and libraries. You might use these also in a
  # non-FIDIUS context, since there are no other FIDIUS-related
  # dependencies.
  module Common

    autoload :VERSION, './fidius-common/version'

    # Since this addon changes behaviour of +to_json+, you have to
    # require it explicitly either with this helper method or manually
    # with
    #
    #  require 'fidius-common/json_symbol_addon'
    #
    # Important note: Both variants will also load and require
    # +active_support+.
    #
    # @return [Boolean]  true if the addon was loaded successfully or
    #                    false if the addon is already loaded.
    def self.install_json_symbol_addon
      require 'fidius-common/json_symbol_addon'
    end

  end # module Common
end # module FIDIUS
