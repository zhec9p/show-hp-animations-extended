module ZVShowHPAnimations
  def self.validate_compatibility
    raise 'You have name conflict(s) with Battle::Visual.zv_configure_hp_animation_handler' if
      Battle::Visual.method_defined?(:zv_configure_hp_animation_handler)

    if Object.const_defined?(:ZVBattleUI)
      names = %i[
        ShowHPAnimationHandler
        ShowHPAnimatorBase
        ShowHPAnimator
        ShowFakeHPAnimator
      ]

      conflict_names = names.find_all { |n| ZVBattleUI.const_defined?(n) }.map { |n| "ZVBattleUI::#{n}" }
      raise "You have name conflict(s) with #{conflict_names.join(', ')}" unless conflict_names.empty?
    end
  end
end

ZVShowHPAnimations.validate_compatibility
