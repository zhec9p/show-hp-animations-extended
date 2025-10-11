module ZVBattleUI
  # Abstract class for creating an animation to show when a battler's HP may go up/down
  class HPAnimatorBase
    # Name of the HP animation creator
    # @return [Symbol]
    def name
      raise 'This method should be implemented in the subclass'
    end

    # @param target [PFM::PokemonBattler]
    # @param hp [Integer]
    # @param effectiveness [Float, nil]
    # @param **others [Hash]
    # @return [Yuki::Animation::TimedAnimation, nil] nil = no animation
    def create_animation(target, hp, effectiveness, **others)
      raise 'This method should be implemented in the subclass'
    end
  end
end
