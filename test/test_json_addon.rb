require 't_helper'
require 'fidius-common/json_symbol_addon'


class JSONSymbolAddonTest < Test::Unit::TestCase
  SIMPLE_HASH_SAMPLE = { :a => 1, :b => 2 }
  SIMPLE_ARRAY_SAMPLE = [ :a, 1, :b, 2 ]
  
  def test_simple_hash
    json = JSON.parse(SIMPLE_HASH_SAMPLE.to_json)
    assert_not_equal SIMPLE_HASH_SAMPLE, json
    assert_equal SIMPLE_HASH_SAMPLE, json.symbolize_keys_if_needed
  end
  
  def test_simple_array
    json = JSON.parse(SIMPLE_ARRAY_SAMPLE.to_json)
    assert_not_equal SIMPLE_ARRAY_SAMPLE, json
    assert_equal SIMPLE_ARRAY_SAMPLE, json.symbolize_keys_if_needed
  end
  
  def test_complex_sample
    sample = {
      :array => SIMPLE_ARRAY_SAMPLE,
      :hash  => SIMPLE_HASH_SAMPLE
    }
    json = JSON.parse(sample.to_json)
    assert_not_equal sample, json
    assert_equal sample, json.symbolize_keys_if_needed
  end

end # class JSONSymbolAddonTest
