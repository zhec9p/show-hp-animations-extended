module ZVBattleUI
  # Base class for creating an animation to show when a battler's HP should change
  class ShowHPAnimatorBase
    # Name of the HP animation creator
    # @return [Symbol]
    def name
      raise 'This method should be implemented in the subclass'
    end

    # @param target [PFM::PokemonBattler]
    # @param hp [Integer]
    # @param effectiveness [Float, nil]
    # @param **others [Hash]
    # @return [Yuki::Animation::TimedAnimation, nil]
    def create_animation(target, hp, effectiveness, **others)
      raise 'This method should be implemented in the subclass'
    end
  end
end
