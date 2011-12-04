require 'rubygems'
require 'rchardet19'
require 'iconv'

module Enco
  def self.to_utf8 string
    #string.unpack('C*').pack('U*') # does not work correctly
    cd = ::CharDet.detect(string, :silent => true)

    #if RUBY_VERSION >= '1.9' and cd.confidence > 0.6 then
    if cd.confidence > 0.6 then
      string.encode('utf-8', cd.encoding, :invalid => :replace)
      #Iconv.conv('UTF-8//IGNORE', cd.encoding, string)
    else
      ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
      ic.iconv(string + ' ')[0..-2]
    end

  end
end
