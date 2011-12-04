# -*- encoding: utf-8 -*-
require "spec_helper"

# TODO add more Test cases
describe Enco do
  before(:each) do
    @simple_string   = %Q{test string\nin }
    @cyrillic_string = %Q{тестовая строка\nin }
  end
  describe "#to_utf8" do
    context "input in" do
      specify "UTF-8" do
        Enco.to_utf8(string_in 'UTF-8').should eq @cyrillic_string + "UTF-8\n"
      end

      specify "KOI8-R" do
        Enco.to_utf8(string_in 'KOI8-R').should eq @cyrillic_string + "KOI8-R\n"
      end

      specify "CP866" do
        Enco.to_utf8(string_in 'CP866').should eq @cyrillic_string + "CP866\n"
      end

      specify "ISO-8859-15" do
        Enco.to_utf8(string_in 'ISO-8859-15').should eq @simple_string + "ISO-8859-15\n"
      end

      specify "WINDOWS-1251" do
        Enco.to_utf8(string_in 'WINDOWS-1251').should eq @cyrillic_string + "WINDOWS-1251\n"
      end
    end
  end
end
