require 'ipaddr' # Used to gain a single address from an IP range.
require 'socket' # Used to determine this host's IP address.

module FIDIUS
  module Common

    # Returns the IP address of that interface, which would connect to
    # an address of the given +iprange+.
    # 
    # @see https://coderrr.wordpress.com/2008/05/28/get-your-local-ip-address/
    #
    # @param [String] iprange  The target IP range, e.g. +127.0.0.0/8+
    #                          or +127.0.0.1+.
    # @return [String]  Your (local) IP address.
    def self.get_my_ip(iprange)
      # backup setting
      orig, Socket.do_not_reverse_lookup = Socket.do_not_reverse_lookup, true
      UDPSocket.open do |s|
        # udp is stateless, so there is no real connect
        s.connect IPAddr.new(iprange).to_s, 1
        s.addr.last
      end
    ensure
      # restore backup
      Socket.do_not_reverse_lookup = orig
    end

  end # module Common
end # FIDIUS
