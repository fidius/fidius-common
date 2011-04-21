#require 't_helper'
require 'test/unit'
require 'fidius-common/yamldb'
require 'sqlite3'
require 'fileutils'

class YamlDbTest < Test::Unit::TestCase
  def test_export
    FileUtils.rm_r 'export_test' if File.exists? 'export_test'
    Dir.mkdir 'export_test'
    FIDIUS::Common::Db.export('test_yamldb/database.yml', 'test_db', 'export_test', false)
  end

  def test_import
    FIDIUS::Common::Db.import('test_yamldb/database.yml', 'test_db', 'export_test/test_db')
    FileUtils.rm_r 'export_test' if File.exists? 'export_test'
    FileUtils.rm 'test_db.sqlite3' if File.exists? 'test_db.sqlite3'
  end
end
