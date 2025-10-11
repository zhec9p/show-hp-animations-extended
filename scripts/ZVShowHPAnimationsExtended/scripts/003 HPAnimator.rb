module ZVBattleUI
  # Creates the animation specifically for a battler's HP going up or down
  class HPAnimator < HPAnimatorBase
    # @param scene [Battle::Scene]
    def initialize(scene)
      super()
      @scene = scene
    end

    # Name of the HP animation creator
    # @return [Symbol]
    def name
      return :hp
    end

    # @param target [PFM::PokemonBattler]
    # @param hp [Integer]
    # @param effectiveness [Float, nil]
    # @param **_others [Hash]
    # @return [Yuki::Animation::TimedAnimation, nil] nil = no animation
    def create_animation(target, hp, effectiveness, **_others)
      return if hp == 0

      return Battle::Visual::HPAnimation.new(@scene, target, hp, effectiveness)
    end
  end
end

module Battle
  class Visual
    class HPAnimation
      def effectiveness_sound(...)
        nil
      end
    end
  end
end
