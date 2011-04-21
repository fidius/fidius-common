# Temporarily uncommented simplecov to let the tests in Jenkins pass
#
# It will raise a segmentation fault when 'rake test' is run
# under the Debian/Ubuntu version of Ruby (1.9.2p0).
# The problem has obviously been fixed between 1.9.2p0 and 1.9.2p35
# because it runs fine here.
#
#require 'simplecov'
#SimpleCov.start
require 'test/unit'
