# -*- coding: utf-8 -*-

module FIDIUS
  module Common
    module Db
      require "fidius-common/yamldb/yaml_db"

      def self.export(config_filename, db_entry, export_filename = "")
        dumper = SerializationHelper::Base.new(YamlDb::Helper, config_filename, db_entry, export_filename)
        dumper.dump_schema
        dumper.dump
      end

      def self.import(config_filename, db_entry, import_filename)
        loader = SerializationHelper::Base.new(YamlDb::Helper, config_filename, db_entry, import_filename)
        loader.load_schema
        loader.load
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
