# CONCRETE CARETAKER
require './originator'
require './memento'

class ChapterCaretaker
  include CaretakerOriginatorCommon

  def initialize
    @versions = []
    @originator = ChapterOriginator.new
  end

  def history
    history = "Versions of chapter:\n"
    @versions.each {|chunk| history += "#{chunk.object_id}\n"}
    history
  end

  def show_state
    @originator.show_state
  end

  def set_state(header, text)
    @originator.set_state header, text
  end

  def save_state
    @originator.save_state self
  end

  def restore(vers = false)
    chunk = (@versions.detect{|c| c.object_id == vers.to_i} || false) if vers
    @versions.delete(chunk) if chunk
    @originator.restore chunk || @versions.pop
  end

  def <<(chunk)
    @versions.push(chunk) if chunk.is_a? TextChunk
  end
end
