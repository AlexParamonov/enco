require "enco"
class String
  def to_utf8 *args
    Enco.to_utf8 self, *args
  end
end