# CONCRETE MEMENTO
class TextChunk
  attr_reader :header, :text
  
  def initialize header, text
    @header = header
    @text = text
    self.freeze
  end
end