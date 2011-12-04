Enco
==========
Enco allows to push related objects to an object's queue for delayed save, that will triggered on object#save. In this case object wil store all related information on its save.

Installation
------------
    gem install enco

Usage
-----

How to start:

1. include Enco:

        require 'enco'
        class Artice
          include Enco
        end

2. call \#mark_as_changed method when object gets dirty:

        class Artice
          def change_attribute attr, value
            @attributes[attr] = value
            mark_as_changed # call this and object will be marked for save
          end
        end

3. point save method to your save logic or dont care if you use #save already:

        class Artice
          # @return [boolean]
          def save
            write
          end
        end

4.  If you want to use validation, include Enco::Plugins::Validation and implement #valid? method. You may got failed objects by enco.objects_with_errors

        class Artice
          include Enco::Plugins::Validation

          # @return [boolean]
          def valid?
            true
          end
        end

5. add Enco to some other classes:

        require 'enco'
        class Tag
          include Enco
        end

        class Artice
          def tags= tag_objects
            @tags = tag_objects
            saved_queue.add_all tag_objects
          end

          def add_tag tag
            @tags ||= []
            @tags << tag
            saved_queue.add tag
          end
        end

6. Use it:

        article = Article.new
        tag_objects = [Tag.new, Tag.new, Tag.new]
        article.tags = tag_object
        article.add_tag Tag.new

        # that will save article and all tags in this article if article
        # and tags are valid, and if article.save and all tag.save returns true
        article.save

7. Handle errors

  7.1. You did not include Enco::Plugins::Validation:

        begin
          article.save
        rescue Enco::FailedSaveError => save_error

          # @params [Hash] info
          # @option info [Array<Object>] :saved
          # @option info [Object]        :failed
          # @option info [Array<Object>] :pending
          save_error.context
        end

  7.2. You've included Enco::Plugins::Validation:

        # Note nothing was actually saved. You dont need to do a cleanup
        unless article.save then
          failed_objects = article.saved_query.objects_with_errors
        end



If you have custom logic for marking objects dirty then you may want to override
\#has_unsaved_changes? method in you class like this:

    def has_unsaved_changes?
      dirty? # dirty is you custom method to determine has object unsaved_changes or not
    end

method \#mark_as_saved becomes useless in this case and you should mark objects by your self.


Note: Today Enco use only #save method to perform save actions on an objects, but later this should be changed to custom option.

Requirements
------------

* ActiveSupport
* rspec2 for testing

Compatibility
-------------
tested with Ruby

* 1.8.7
* 1.9.2
* 1.9.3
* jruby
* ruby-head
* ree

see [build history](http://travis-ci.org/#!/AlexParamonov/enco/builds)

Copyright
---------
Copyright © 2011 Alexander N Paramonov. See LICENSE for details.