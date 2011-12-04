# -*- encoding: utf-8 -*-
require "spec_helper"

# TODO add more Test cases
describe Enco do
  before(:each) do
    @simple_string   = %Q{test string\nin }
    @cyrillic_string = %Q{тестовая строка\nin }
  end
  describe "#to_utf8" do
    describe "argument is" do
      context "a string in" do
        specify "UTF-8 encoding" do
          result = Enco.to_utf8(string_in 'UTF-8')
          result.should eq @cyrillic_string + "UTF-8\n"
          result.encoding.to_s.should == "UTF-8"
        end

        specify "KOI8-R encoding" do
          result = Enco.to_utf8(string_in 'KOI8-R')
          result.should eq @cyrillic_string + "KOI8-R\n"
          result.encoding.to_s.should == "UTF-8"
        end

        specify "CP866 encoding" do
          result = Enco.to_utf8(string_in 'CP866')
          result.should eq @cyrillic_string + "CP866\n"
          result.encoding.to_s.should == "UTF-8"
        end

        specify "ISO-8859-15 encoding" do
          result = Enco.to_utf8(string_in 'ISO-8859-15')
          result.should eq @simple_string + "ISO-8859-15\n"
          result.encoding.to_s.should == "UTF-8"
        end

        specify "WINDOWS-1251 encoding" do
          result = Enco.to_utf8(string_in 'WINDOWS-1251')
          result.should eq @cyrillic_string + "WINDOWS-1251\n"
          result.encoding.to_s.should == "UTF-8"
        end
      end

      context "a frozen string" do
        before(:each) do
          @test_string = "test string".force_encoding "ISO-8859-15"
        end

        it "should perform conversion" do
          result = Enco.to_utf8 @test_string.freeze
          result.encoding.to_s.should == "UTF-8"
        end

        it "should not change input string" do
          Enco.to_utf8 @test_string.freeze

          @test_string.encoding.to_s.should == "ISO-8859-15"
        end

        context "ignore_frozen flag set to true" do
          it "should return string itself" do
            result = Enco.to_utf8 @test_string.freeze, :ignore_frozen => true
            result.should eq @test_string
            result.encoding.to_s.should == "ISO-8859-15"
          end
        end
      end

      context "not a string" do
        describe "should ignore argument and return it back for" do
          specify "nil" do
            result = Enco.to_utf8 nil
            result.should be_nil
          end

          specify "object" do
            object = Object.new
            result = Enco.to_utf8 object
            result.should eql object
          end
        end
      end

    end
  end
end
