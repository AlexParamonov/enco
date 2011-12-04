# -*- encoding: utf-8 -*-
require "spec_helper"
require "enco/string_to_utf8"

# TODO add more Test cases
describe String do
  describe "#to_utf8" do
    before(:each) do
      @test_string = "test string"
    end
    it "should delegate to Enco#to_utf8" do
      Enco.should_receive(:to_utf8).with(@test_string).once

      @test_string.to_utf8
    end

    it "should pass options to Enco#to_utf8" do
      Enco.should_receive(:to_utf8).with(@test_string, :some_param => true).once

      @test_string.to_utf8 :some_param => true
    end
  end
end
