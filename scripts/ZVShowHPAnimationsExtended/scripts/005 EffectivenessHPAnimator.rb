module ZVBattleUI
  # Creates the effectiveness sound animation animation for HP going down
  class EffectivenessHPAnimator < ShowHPAnimatorBase
    # @param _target [PFM::PokemonBattler]
    # @param _hp [Integer]
    # @param effectiveness [Float, nil]
    # @param **_others [Hash]
    # @return [Yuki::Animation::TimedAnimation, nil]
    def create_animation(_target, _hp, effectiveness, **_others)
      return if effectiveness.nil?

      ya = Yuki::Animation
      anim = ya.se_play('hitlow')
      anim = ya.se_play('hit') if effectiveness == 1
      anim = ya.se_play('hitplus') if effectiveness > 1
      anim.start
      return anim
    end
  end
end
