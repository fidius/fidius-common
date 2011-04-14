# -*- coding: utf-8 -*-

module FIDIUS
  module Common
    module Db
      require "fidius-common/yamldb/yaml_db"

      def self.export(config_filename, db_entry, timestamp = true)
        dumper = SerializationHelper::Base.new(YamlDb::Helper, config_filename, db_entry)
        dumper.dump(timestamp)
      end

      def self.import(config_filename, db_entry, import_dir)
        loader = SerializationHelper::Base.new(YamlDb::Helper, config_filename, db_entry)
        loader.load(import_dir)
      end

      #TODO:
      #in bin einbauen
      #tests schreiben
      #universal machen
      #in fidius-common einfügen
      #in cve-db einfügen
    end
  end
end
