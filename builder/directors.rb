# ABSTRACT DIRECTOR
require './builder'

class SkateboardBuilderDirector
  def self.construct
    raise(
      NotImplementedError,
      'Redeclare this method in a child class, don\'t use the abstract method!'
    )
  end

  private_methods :new
end

# CONCRETE DIRECTORS
class ZeroSkateboardBuilderDirector < SkateboardBuilderDirector
  def self.construct
    SkateboardBuilder.new('Zero brand skateboard')
    .use_deck('Zero PY Blood Skull', :maple, 7)
    .use_trucks('Thunder Nightliner TL', 21.6, %i[red black])
    .use_bearings('Zero', 3, %i[black white])
    .use_wheels('Zero', 52, 101, 'dark siluet on white background')
    .use_griptape(
      'Spitfire Swirl Bar SU17',
      'yellow horizontal stripe on dark background'
    ).build!
  end
end

class BlindSkateboardBuilderDirector < SkateboardBuilderDirector
  def self.construct
    SkateboardBuilder.new('Blind brand skateboard')
    .use_deck('Blind Dark Horse Red/Black', :maple, 7)
    .use_trucks('Blind 5.0', 21.6, %i[silver black])
    .use_bearings('Blind Lifetaker', 5, %i[black silver])
    .use_wheels('Blind', 53, 99, 'red word blind on black background')
    .use_griptape('Mob Grip Tape SU17', 'grey color').build!
  end
end

class CustomSkateboardBuilderDirector < SkateboardBuilderDirector
  def self.construct
    SkateboardBuilder.new('Great custom build skateboard')
    .use_deck('Girl Wilson Contemporary OG SU17', :maple, 7)
    .use_trucks('Revol Heart 5.0 FA17', 20.5, %i[white_cream black])
    .use_bearings('Cliche FA14', 3, %i[black yellow])
    .use_wheels(
      'Spitfire F4 99 AFTERB', 52, 99, 'pink cartoon faces on orange background'
    )
    .use_griptape(
      'Spitfire Headed Fade SU17', 'yellow cartoon faces on black background'
    ).build!
  end
end
