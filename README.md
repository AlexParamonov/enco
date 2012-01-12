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

Enco may handle frozen strings.
If you'll pass frozen string to it, it'll return utf8 analog, but not frozen.
If you dont want to convert frozen string, pass :ignore_frozen => true and Enco will ignore that string:

    frozen_string = "hi there!".frozen
    Enco.to_utf8 frozen_string, :ignore_frozen => true # returns frozen_string
    Enco.to_utf8 frozen_string                         # returns dup of frozen_string, converted to utf-8

### Plugins
Add

    require 'enco/string_to_utf8'

and you'll get

    "hi there!".to_utf8
This method accepts same options as

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