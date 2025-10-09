module ZVBattleUI
  # Creates the animation specifically for HP going up or down
  class ShowHPAnimator < ShowHPAnimatorBase
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
      return if hp == 0

      return Battle::Visual::HPAnimation.new(@scene, target, hp, effectiveness)
    end
  end
end
