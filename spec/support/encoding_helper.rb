def string_in(encoding)
  File.read(File.dirname(File.expand_path(__FILE__)) << "/../fixtures/" << encoding.upcase)
end