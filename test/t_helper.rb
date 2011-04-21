require 'simplecov'
SimpleCov.start
require 'test/unit'

require 'active_record'
require 'test_yamldb/models/abc'
require 'test_yamldb/models/def'
require 'test_yamldb/db-install'

include FIDIUS

def prepare_test_db
  #delete and migrate new test db
  FIDIUS.migrate('test/test_yamldb/migrations', 'test/test_yamldb')
end

