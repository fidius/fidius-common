# FIDIUS Common libraries

This RubyGem is a small collection of some commonly used methods and
module extensions of the FIDIUS project. These methods are meant to run
standalone (i.e. without setting up a FIDIUS C&C server).


## Installation

Simply install this package with RubyGems:

    $ gem install fidius-common


## Example of use

You can use this library as any other RubyGem:

    require 'rubygems' if RUBY_VERSION < '1.9'
    require 'fidius-common'

For an overview of the provided methods, have a look into the
[API documentation](http://rubydoc.info/gems/fidius-common/frames).
Currently, there is no special sorting, but that may change in future.


## Authors and Contact

The common library was written by

* FIDIUS Intrusion Detection with Intelligent User Support
  <grp-fidius+fidicom@tzi.de>, <http://fidius.me>
* in particular:
  * Dominik Menke <dmke+fidicom@tzi.de>
  * Bernd Katzmarski <bkatzm+fidicom@tzi.de>

If you have any questions, remarks, suggestion, improvements,
etc. feel free to drop a line at the addresses given above.
You might also join `#fidius` on Freenode or use the contact
form on our [website](http://fidius.me/en/contact).


## License

Simplified BSD License and GNU GPLv2. See also the file LICENSE.
