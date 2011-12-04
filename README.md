Enco
==========
Enco will convert any string to utf-8

Installation
------------
    gem install enco

Usage
-----
It is simple. Just call

    my_utf8_string = Enco.to_utf8 any_string

It will return non string objects back:

    Enco.to_utf8(not_a_string) === not_a_string

works correctly with frozen strings. If you dont want to convert frozen string, pass :ignore_frozen => true and Enco
will ignore that string:

    Enco.to_utf8 any_string.frozen, :ignore_frozen => true # returns frozen string
    Enco.to_utf8 any_string.frozen                         # returns dup of any_string, converted to utf-8

### Plugins
Add

    require 'enco/string_to_utf8'

end you'll get

    "any string".to_utf8
method that accept same options as

    Enco.to_utf8 "any string"


Requirements
------------

* Ruby 1.9
* rchardet19

Compatibility
-------------
tested with Ruby

* 1.9.2
* 1.9.3
* jruby
* ruby-head

see [build history](http://travis-ci.org/#!/AlexParamonov/enco/builds)

Contributing
-------------
see [contributing guide](http://github.com/AlexParamonov/enco/blob/master/CONTRIBUTING.md)

Copyright
---------
Copyright © 2011 Alexander N Paramonov.
Released under the MIT License. See the LICENSE file for further details.