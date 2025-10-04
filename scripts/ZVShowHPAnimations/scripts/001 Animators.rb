module ZVBattleUI
  # Base class for creating animations to show when a battler's HP is changed
  class ShowHPAnimatorBase
    # Create the animation
    # @param target [PFM::PokemonBattler]
    # @param hp [Integer]
    # @param effectiveness [Float, nil]
    # @param **others [Hash]
    # @return [Yuki::Animation::TimedAnimation, nil]
    # @note This animation must dispose. ShowHPAnimationHandler will not be responsible for it.
    def create_animation(target, hp, effectiveness, **others)
      raise 'This method should be implemented in the subclass'
    end
  end

  class ShowFakeHPAnimator < ShowHPAnimatorBase
    # @param scene [Battle::Scene]
    def initialize(scene)
      super()
      @scene = scene
    end

    # Create the animation
    # @param target [PFM::PokemonBattler]
    # @param hp [Integer]
    # @param effectiveness [Float, nil]
    # @param **_others [Hash]
    # @return [Yuki::Animation::TimedAnimation, nil]
    # @note This animation must dispose. ShowHPAnimationHandler will not be responsible for it.
    def create_animation(target, hp, effectiveness, **_others)
      return if hp != 0

      return Battle::Visual::FakeHPAnimation.new(@scene, target, effectiveness)
    end
  end

  class ShowHPAnimator < ShowHPAnimatorBase
    # @param scene [Battle::Scene]
    def initialize(scene)
      super()
      @scene = scene
    end

    # Create the animation
    # @param target [PFM::PokemonBattler]
    # @param hp [Integer]
    # @param effectiveness [Float, nil]
    # @param **_others [Hash]
    # @return [Yuki::Animation::TimedAnimation, nil]
    # @note This animation must dispose. ShowHPAnimationHandler will not be responsible for it.
    def create_animation(target, hp, effectiveness, **_others)
      return if hp == 0

      return Battle::Visual::HPAnimation.new(@scene, target, hp, effectiveness)
    end
  end
end
