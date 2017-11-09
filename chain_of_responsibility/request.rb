# CONCRETE REQUEST
class EditorialOrder
  attr_reader :sections

  def initialize *sections
    @sections = [*sections]
    @magazine = []
  end

  def << article
    return false unless article.is_a? Hash
    @magazine << article
  end

  def >> section
    @sections.delete_at(@sections.index(section) || @sections.size + 1)
  end

  def to_s
    full_text = ''
    @magazine.each do |page|
      title = "\e[1m\e[32m#{page[:title].upcase}\e[0m\n"
      annotation = page[:annotation] ? "\e[1m#{page[:annotation]}\e[0m\n" : ''
      photo = page[:photo] ? "\e[34m#{page[:photo]}\e[0m\n" : ''
      text = page[:text] ? page[:text] + "\n" : ''
      full_text += title + annotation + photo + text + '-' * 50 + "\n"
    end
    full_text
  end
end