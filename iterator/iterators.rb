# ABSTRACT ITERATOR
class Iterator
  def initialize aggregate
    @subject = aggregate
    @position = 0
  end

  def first
    @position = 0
    return_subject
  end

  def previous
    @position -= 1 if @position > 0
    return_subject
  end

  def previous?
    @position > 0
  end

  def current
    return_subject
  end

  [:next, :last, :next?, :return_subject].each do |mth|
    define_method(mth) do
      raise NotImplementedError, 'Please, redeclare this method in a child class, don\'t use the abstract method!'
    end
  end

  private :return_subject
end

# CONCRETE ITERATORS
class ItemIterator < Iterator
  def next
    @position += 1 if @position + 1 < @subject.items.size
    return_subject
  end

  def next?
    @position < @subject.items.size - 1
  end

  def last
    @position = @subject.items.size - 1
    return_subject
  end

  private

  def return_subject
    "#{@subject}\n#{@subject.items[@position]}"
  end
end

class PageIterator < Iterator
  def initialize aggregate, onpage = 5
    super aggregate
    @on_page = onpage
  end

  def next 
    @position += 1 if (@position + 1) * @on_page < @subject.items.size
    return_subject
  end

  def next?
    ((@position + 1) * @on_page) < @subject.items.size
  end

  def last
    @position = ((@subject.items.size - 1) / @on_page).ceil
    return_subject
  end

  private

  def return_subject
    str = ''
    @subject.items[@position*@on_page..@position*@on_page + @on_page].each {|item| str += item.to_s}
    "#{@subject}\n#{str}"
  end
end