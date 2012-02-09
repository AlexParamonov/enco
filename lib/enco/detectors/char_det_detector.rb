require 'rchardet19'

module Enco
  class CharDetDetector
    def self.detect(string)
      CharDetResult.compose ::CharDet.detect(string, :silent => true)
    end
  end

  class CharDetResult
    def self.compose(result)
      result
    end
  end
end