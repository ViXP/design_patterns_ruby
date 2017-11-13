# ABSTRACT HANDLER
class Department
  @next_receiver = nil
  @responsibility = nil

  def self.next_receiver=(receiver)
    @next_receiver = receiver if receiver.respond_to? :handle
  end

  def self.handle(rq)
    unless rq.is_a?(EditorialOrder)
      raise(ArgumentError, 'The request must have EditorialOrder class!')
    end
    if rq.sections.first == @responsibility || rq.sections.first == :all
      yield(rq)
      rq >> @responsibility
    end
    @next_receiver.nil? || rq.sections.empty? ? rq : @next_receiver.handle(rq)
  end
end

# CONCRETE RECEIVERS
class SportsDepartment < Department
  @responsibility = :sport

  def self.handle(request)
    super(request) do |req|
      req << {
        title: 'The swimmer breaks the record',
        photo: 'Some cool looking swimmer',
        text: 'Yesterday this not really well known swimmer broke his own ' \
        'record in freestyle swimming.'
      }
    end
  end
end

class NewsDepartment < Department
  @responsibility = :news

  def self.handle(request)
    super(request) do |req|
      req << {
        title: 'The president of Neverland came out of the closet',
        annotation: 'Two days ago journalists saw the president of Neverland ' \
        'while he was coming out of the water closet. He washed his hands ' \
        'and saluted the journalists of our magazine.'
      }
    end
  end
end

class CultureDepartment < Department
  @responsibility = :culture

  def self.handle(request)
    super(request) do |req|
      req << {
        title: 'Lady Yaga denies her involvement in a Russian business',
        photo: 'Lady Yaga riding the green midget',
        text: 'Our interviewer asked Lady Yaga after hew yesterday\'s show ' \
        'about the rumors of her involvment in marketing of the same name ' \
        'popular harmful drink from Russia. "I have nothing to do with this ' \
        's*it," was her answer.'
      }
    end
  end
end

class InvestigationsDepartment < Department
  @responsibility = :investigation

  def self.handle(request)
    super(request) do |req|
      req << {
        title: 'The Mayor of our town steals the carrot!',
        text: 'Our special agents Moulded & Scale conducted their ' \
        'investigation in a sensational case of a disappeared carrot from ' \
        'Mr. Johnes field. They\'ve have found 2 pounds of carrot inside the ' \
        'mayor\'s barn. "Our town never encountered the crimes of such ' \
        'scale," agent Scale commented.'
      }
    end
  end
end

class PrintDepartment < Department
  @responsibility = :print

  def self.handle(request)
    super(request) do |req|
      puts request.to_s
      return request if request.sections.first == :all
    end
  end
end
