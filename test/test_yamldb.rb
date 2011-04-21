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
  def test_export
    DbInstall.migrate(MIGRATIONS, BASE_DIR)

    FIDIUS::Common::Db.export(DB_CONFIG, 'test_db', BASE_DIR, false)
  end

  def test_import
    FIDIUS::Common::Db.import(DB_CONFIG, 'test_db', EXPORT_DIR)

    assert_equal(1, Abc.all.size)
    assert_equal(1, Def.all.size)
    assert_equal('TestA', Abc.first.a)
    assert_equal(2, Def.first.d)

    FileUtils.rm_r EXPORT_DIR if File.exists? EXPORT_DIR
    FileUtils.rm TEST_DB if File.exists? TEST_DB
  end
end
