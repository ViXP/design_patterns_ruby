# CONCRETE RECEIVERS
class Drawer
  @symbol = :''

  def self.print_symbol
    print @symbol
  end

  def self.print_space
    print "\e[8m▓\e[0m"
  end

  def self.print_break_line
    print "\n"
  end

  def self.undo_break_line
    Stream.clear
    temp = Stream.output.clone.chomp
    print temp
    Stream.output = temp
  end

  def self.undo_print_symbol
    print "\b \b"
    Stream.output = Stream.output[0...-4]
  end

  def self.print(arg)
    super arg
    Stream.output += arg.to_s
  end

  private_methods :new
end

class TopLeftCornerDrawer < Drawer
  @symbol = :╔
end

class TopRightCornerDrawer < Drawer
  @symbol = :╗
end

class BottomLeftCornerDrawer < Drawer
  @symbol = :╚
end

class BottomRightCornerDrawer < Drawer
  @symbol = :╝
end

class HorizontalLineDrawer < Drawer
  @symbol = :═
end

class VerticalLineDrawer < Drawer
  @symbol = :║
end

class SolidFillDrawer < Drawer
  @symbol = :▓
end

class SpotFillDrawer < Drawer
  @symbol = :░
end
