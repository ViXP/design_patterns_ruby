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
    system('clear')
    temp = $OUTPUT.clone.chomp
    print temp
    $OUTPUT = temp
  end

  def self.undo_print_symbol
    print "\b \b"
    $OUTPUT = $OUTPUT[0...-4]
  end

  def self.print arg
    super arg
    $OUTPUT += arg.to_s
  end
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