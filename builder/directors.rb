# ABSTRACT DIRECTOR
require './builder'

class SkateboardBuilderDirector
  def self.construct
    raise NotImplementedError, 'Please, redeclare this method in child class, don\'t use the abstract method!'
  end
end

# CONCRETE DIRECTORS
class ZeroSkateboardBuilderDirector < SkateboardBuilderDirector
  def self.construct
    SkateboardBuilder.new('Zero brand skateboard')
    .set_deck('Zero PY Blood Skull', :maple, 7)
    .set_trucks('Thunder Nightliner TL', 21.6, [:red, :black])
    .set_bearings('Zero', 3, [:black, :white])
    .set_wheels('Zero', 52, 101, 'dark siluet on white background')
    .set_griptape('Spitfire Swirl Bar SU17', 'yellow horizontal stripe on dark background').build!
  end
end

class BlindSkateboardBuilderDirector < SkateboardBuilderDirector
  def self.construct
    SkateboardBuilder.new('Blind brand skateboard')
    .set_deck('Blind Dark Horse Red/Black', :maple, 7)
    .set_trucks('Blind 5.0', 21.6, [:silver, :black])
    .set_bearings('Blind Lifetaker', 5, [:black, :silver])
    .set_wheels('Blind', 53, 99, 'red word blind on black background')
    .set_griptape('Mob Grip Tape SU17', 'grey color').build!
  end
end

class CustomSkateboardBuilderDirector < SkateboardBuilderDirector
  def self.construct
    SkateboardBuilder.new('Great custom build skateboard')
    .set_deck('Girl Wilson Contemporary OG SU17', :maple, 7)
    .set_trucks('Revol Heart 5.0 FA17', 20.5, [:white_cream, :black])
    .set_bearings('Cliche FA14', 3, [:black, :yellow])
    .set_wheels('Spitfire F4 99 AFTERB', 52, 99, 'pink cartoon faces on orange background')
    .set_griptape('Spitfire Headed Fade SU17', 'yellow cartoon faces on black background').build!
  end
end