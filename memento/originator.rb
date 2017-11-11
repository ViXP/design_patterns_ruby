# COMMON CARETAKER & ORIGINATOR INTERFACE
require './caretaker'
require './memento'

module CaretakerOriginatorCommon
  %i[show_state set_state save_state restore].each do |mth|
    define_method(mth) do |*|
      raise(
        NotImplementedError,
        'Redeclare this method in a child class, don\'t use the abstract ' \
        'method!'
      )
    end
  end
end

# CONCRETE ORIGINATOR
class ChapterOriginator
  include CaretakerOriginatorCommon

  def initialize
    @current_header = ''
    @current_text = ''
  end

  def show_state
    "Header: #{@current_header}\n" \
    "Text: #{@current_text}\n" \
    '-------------------------'
  end

  def set_state(header, text)
    @current_header = header if header
    @current_text = text if text
  end

  def save_state(caretaker)
    return false unless caretaker.is_a? ChapterCaretaker
    new_version = TextChunk.new(@current_header, @current_text)
    caretaker << new_version
    new_version
  end

  def restore(chunk)
    return false unless chunk.is_a? TextChunk
    @current_header = chunk.header
    @current_text = chunk.text
  end
end
