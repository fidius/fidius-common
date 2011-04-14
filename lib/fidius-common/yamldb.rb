# -*- coding: utf-8 -*-

module FIDIUS
  module Common
    module Db
      require "fidius-common/yamldb/yaml_db"

      #Exports database schema and content to yml file. This should work
      #for all ActiveRecord database adapters.
      #
      #@param [String] path to yml file with database configuration
      #@param [String] name of the db to export, must match an entry in the yml configuration file.
      #@param [String] target dir where the exported data should be stored
      #@param [Boolean] create target dir with timestamp in the dirname
      #
      def self.export(config_filename, db_entry, target_dir = "", timestamp = true)
        dumper = SerializationHelper::Base.new(YamlDb::Helper, config_filename, db_entry)
        dumper.dump(target_dir, timestamp)
      end

      #Imports the content of a previously exported yml file.
      #
      #@param [String] path to yml file with database configuration
      #@param [String] name of the db to export, must match an entry in the yml configuration file.
      #@param [String] dir to the previously exported yml file
      #
      def self.import(config_filename, db_entry, import_dir)
        loader = SerializationHelper::Base.new(YamlDb::Helper, config_filename, db_entry)
        loader.load(import_dir)
      end
    end
  end
end
