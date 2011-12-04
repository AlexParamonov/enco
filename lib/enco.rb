require 'rchardet19'

# Enco will convert any string to utf-8
# Just call Enco.to_utf8 any_string
# It will return non string objects back: Enco.to_utf8(not_a_string) === not_a_string
module Enco
  # @param [String] string
  # @param [Hash] options
  # @option options [Boolean] :ignore_frozen
  def self.to_utf8 string, options = {}
    return string unless string.is_a? String
    if string.frozen?
      return string if true == options[:ignore_frozen]
      string = string.dup
    end

    cd = ::CharDet.detect(string, :silent => true)

    if cd.confidence > 0.5 then
      string.encode('utf-8', cd.encoding, :invalid => :replace)
    else
      force_to_utf8 string
    end
  end

  private
  def self.force_to_utf8 string
    require 'iconv'
    ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
    ic.iconv(string + ' ')[0..-2]
  end
end
