require 'fidius-common/ip-helper'
require 'test/unit'

class IPHelperTest < Test::Unit::TestCase
  def test_get_localhost
    ip = FIDIUS::Common.get_my_ip '127.0.0.1'
    assert_equal '127.0.0.1', ip
  end
  
  def test_get_invalid_host
    assert_raise ArgumentError do
      FIDIUS::Common.get_my_ip '300.0.0.0'
    end
  end
  
  def test_get_google_dns
    begin
      # run `ifconfig` to determine possible addresses?
      ip = FIDIUS::Common.get_my_ip '8.8.8.8'
      assert_not_nil ip
    rescue Errno::ENETUNREACH
      puts "Skipped get_google_dns, since network is not reachable"
    end
  end
end
