# -*- coding: utf-8 -*-

module FIDIUS
  module Common
    module YamlDb
      require "yamldb/yaml_db"

      def self.export(config_filename, export_filename = "")
        dumper = SerializationHelper::Base.new(Helper)
        dumper.dump_schema
        dumper.dump(config_filename, export_filename)
      end

      def self.import(config_filename, import_filename = "")
        loader = SerializationHelper::Base.new(Helper)
        loader.load_schema
        loader.load(config_filename, import_filename)
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
