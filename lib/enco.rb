require 'enco/detectors/char_det_detector'
require 'enco/detectors/charlock_holmes_detector'

# Enco will convert any string to utf-8
# Just call Enco.to_utf8 any_string
# It will return non string objects back: Enco.to_utf8(not_a_string) === not_a_string
module Enco
  # @param [String] string
  # @param [Hash] options
  def self.to_utf8(string, options = {})
    return string unless string.is_a? String
    string = string.dup

    detectors.each do |detector|
      cd = detector.detect(string)
      # TODO add logger
      #puts (string)
      #puts (detector.inspect)
      #puts (cd.encoding)
      #puts (cd.confidence)
      if cd.confidence > 0.5 then
        return string.encode('utf-8', cd.encoding, :invalid => :replace)
      else
        next
      end
    end

    force_to_utf8 string
  end

  private
  def self.force_to_utf8 string
    require 'iconv'
    ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
    ic.iconv(string + ' ')[0..-2]
  end

  def self.detectors
    [CharlockHolmesDetector, CharDetDetector]
  end

  #def self.detector
  #  @detector ||= CharlockHolmes::EncodingDetector.new
  #end
end
