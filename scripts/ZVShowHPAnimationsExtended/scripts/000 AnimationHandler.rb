module ZVBattleUI
  # Handler for creating animations to be shown when a battler's HP is changed
  class ShowHPAnimationHandler
    # Create a new HP animation handler
    def initialize
      @animators = []
    end

    # Add an HP animation creator.
    # @param animator [ZVBattleUI::ShowHPAnimatorBase]
    def add(animator)
      @animators << animator
    end

    # Create all relevant animations for a battler's HP change
    # @param target [PFM::PokemonBattler]
    # @param hp [Integer]
    # @param effectiveness [Float, nil]
    # @param **others [Hash]
    # @return Array[Yuki::Animation::TimedAnimation]
    def create_animations(target, hp, effectiveness, **others)
      animations = @animators.map { |a| a.create_animation(target, hp, effectiveness, **others) }
      return animations.compact
    end
  end
end
