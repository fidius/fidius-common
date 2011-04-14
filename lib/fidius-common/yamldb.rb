# -*- coding: utf-8 -*-

module FIDIUS
  module Common
    module Db
      require "fidius-common/yamldb/yaml_db"

      def self.export(config_filename, db_entry, target_dir = "", timestamp = true)
        dumper = SerializationHelper::Base.new(YamlDb::Helper, config_filename, db_entry)
        dumper.dump(target_dir, timestamp)
      end

      def self.import(config_filename, db_entry, import_dir)
        loader = SerializationHelper::Base.new(YamlDb::Helper, config_filename, db_entry)
        loader.load(import_dir)
      end
    end
  end
end
