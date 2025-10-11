module ZVBattleUI
  # Creates the waiting animation for 0 HP being dealt
  class FakeHPAnimator < HPAnimatorBase
    # @param scene [Battle::Scene]
    def initialize(scene)
      super()
      @scene = scene
    end

    # Name of the HP animation creator
    # @return [Symbol]
    def name
      return :fake_hp
    end

    # @param target [PFM::PokemonBattler]
    # @param hp [Integer]
    # @param effectiveness [Float, nil]
    # @param **_others [Hash]
    # @return [Yuki::Animation::TimedAnimation, nil] nil = no animation
    def create_animation(target, hp, effectiveness, **_others)
      return if hp != 0

      return Battle::Visual::FakeHPAnimation.new(@scene, target, effectiveness)
    end
  end
end

module Battle
  class Visual
    class FakeHPAnimation
      def effectiveness_sound(...)
        nil
      end
    end
  end
end
