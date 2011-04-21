require 't_helper'
require 'fidius-common/yamldb'
require 'sqlite3'
require 'fileutils'

require 'test_yamldb/db-install'
require 'test_yamldb/models/abc'
require 'test_yamldb/models/def'

BASE_DIR = File.join('test','test_yamldb')
MIGRATIONS = File.join(BASE_DIR, 'migrations')
DB_CONFIG = File.join(BASE_DIR, 'database.yml')
EXPORT_DIR = File.join(BASE_DIR, 'test_db')
TEST_DB = File.join(BASE_DIR, 'test_db.sqlite3')

include DbInstall

class YamlDbTest < Test::Unit::TestCase

  def setup
    DbInstall.migrate(MIGRATIONS, BASE_DIR)

    FIDIUS::Common::Db.export(DB_CONFIG, 'test_db', BASE_DIR, false)
  end

  def test_export
    assert(File.exists?(EXPORT_DIR))
    assert(File.exists?(File.join(EXPORT_DIR, 'test_db.yml')))
    assert(File.exists?(File.join(EXPORT_DIR, 'schema.rb')))
  end

  def test_import
    FIDIUS::Common::Db.import(DB_CONFIG, 'test_db', EXPORT_DIR)
  end

  def teardown
    FileUtils.rm_r EXPORT_DIR if File.exists? EXPORT_DIR
    FileUtils.rm TEST_DB if File.exists? TEST_DB
  end
end
