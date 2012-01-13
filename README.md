Enco
==========
Enco will convert any string to utf-8, based on original string encoding.

Installation
------------
    gem install enco

Usage
-----
It is simple. Just call

    my_utf8_string = Enco.to_utf8 any_string

If you pass something other, than a string, it'll return non string objects back:

    Enco.to_utf8(not_a_string) === not_a_string # true

Enco does not touch input string, so you may pass frozen strings to it and it'll handle them correctly.

    frozen_string = "hi there!".frozen
    Enco.to_utf8 frozen_string         # utf-8 analog of frozen_string

### Plugins
Add

    require 'enco/string_to_utf8'

and you'll get #to_utf-8 method on String objects:

    "hi there!".to_utf8
It delegates to Enco.to_utf8 and accepts same options as

    Enco.to_utf8 "hi there!"


Requirements
------------

* Ruby 1.9
* rchardet19

Compatibility
-------------
tested with Ruby

* 1.9.2
* 1.9.3
* ruby-head

see [build history](http://travis-ci.org/#!/AlexParamonov/enco/builds)

Contributing
-------------
see [contributing guide](http://github.com/AlexParamonov/enco/blob/master/CONTRIBUTING.md)

Copyright
---------
Copyright © 2011 Alexander N Paramonov.
Released under the MIT License. See the LICENSE file for further details.