module ZVBattleUI
  # Handler for creating animations to show when a battler's HP may go up/down
  class ShowHPAnimationHandler
    def initialize
      @animators = []
    end

    # Add an HP animation creator.
    # @param animator [ZVBattleUI::HPAnimatorBase]
    def add(animator)
      @animators << animator
    end

    # Delete a specific HP animation creator(s)
    # @param name [Symbol] Name of the HP animation creator
    def delete_animator(name)
      @animators.reject! { |a| a.name == name }
    end

    # Create all relevant animations when a battler's HP may go up/down
    # @param target [PFM::PokemonBattler]
    # @param hp [Integer]
    # @param effectiveness [Float, nil]
    # @param **others [Hash]
    # @return [Array<Yuki::Animation::TimedAnimation>]
    def create_animations(target, hp, effectiveness, **others)
      animations = @animators.map { |a| a.create_animation(target, hp, effectiveness, **others) }
      return animations.compact
    end
  end
end
