require 'charlock_holmes'

module Enco
  class CharlockHolmesDetector
    def self.detect(string)
      CharlockHolmesResult.compose detector.detect(string)
    end

    def self.detector
      @detector ||= CharlockHolmes::EncodingDetector.new
    end
  end

  class CharlockHolmesResult
    def self.compose(result)
      result[:confidence] = result.fetch(:confidence) / 100.00
      k,v = result.to_a.transpose
      Struct.new(*k).new(*v)
    end
  end
end