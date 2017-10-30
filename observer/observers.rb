# ABSTRACT OBSERVER
require 'digest'

class Client
  def initialize
    @password = ''
    @color_code = @color_code || 39
    generate_pass @password
    connect
  end

  def connect
    PasswordSendingMachine.register(self)
    puts "\e[#{@color_code}m#{self.class.name} (#{self.object_id}) connected.\e[0m"
  end

  def disconnect
    PasswordSendingMachine.unregister(self)
    puts "#{self.class.name} (#{self.object_id}) disconnected."
  end

  def update data
    old_pass = @password
    generate_pass data
    puts <<-TEXT
      \e[#{@color_code}mI am the #{self.class.name} (#{self.object_id}).
      My old private password was: #{old_pass}.
      I have received the new public password: #{data.tr("\n", '')}. 
      My new private password now is: #{@password}\n\e[0m
    TEXT
  end

  def generate_pass password
    raise NotImplementedError, 'Please, redeclare this method in a child class, don\'t use the abstract method!'
  end
end

# CONCRETE OBSERVERS
class Base64Client < Client
  def initialize
    @color_code = 34
    super
  end

  def generate_pass password
    @password = Digest::SHA256.base64digest(password + self.object_id.to_s)
  end
end

class SHA256Client < Client
  def initialize
    @color_code = 90
    super
  end

  def generate_pass password
    @password = Digest::SHA256.new.digest(password + self.object_id.to_s)
  end
end

class HEXClient < Client
  def initialize
    @color_code = 33
    super
  end

  def generate_pass password
    @password = Digest::SHA256.hexdigest(password + self.object_id.to_s)
  end
end

class MD5Client < Client
  def initialize
    @color_code = 91
    super
  end

  def generate_pass password 
    @password = Digest::MD5.new.update(password + self.object_id.to_s)
  end
end