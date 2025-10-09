module ZVBattleUI
  # Creates the waiting animation for 0 HP being dealt
  class ShowFakeHPAnimator < ShowHPAnimatorBase
    # @param scene [Battle::Scene]
    def initialize(scene)
      super()
      @scene = scene
    end

    # @param target [PFM::PokemonBattler]
    # @param hp [Integer]
    # @param effectiveness [Float, nil]
    # @param **_others [Hash]
    # @return [Yuki::Animation::TimedAnimation, nil]
    def create_animation(target, hp, effectiveness, **_others)
      return if hp != 0

      return Battle::Visual::FakeHPAnimation.new(@scene, target, effectiveness)
    end
  end
end
