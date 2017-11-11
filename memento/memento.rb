# CONCRETE MEMENTO
class TextChunk
  attr_reader :header, :text

  def initialize(header, text)
    @header = header
    @text = text
    freeze
  end
end
