proc do
  raise 'Name conflict with Battle::Visual.zv_configure_hp_animation_handler' if
    Battle::Visual.method_defined?(:zv_configure_hp_animation_handler)

  raise 'Name conflict with @zv_hp_animators in Battle::Visual' if
    Battle::Visual.instance_variable_defined?(:@zv_hp_animators)

  if Object.const_defined?(:ZVBattleUI)
    class_names = %i[
      ShowHPAnimationHandler
      HPAnimatorBase
      HPAnimator
      FakeHPAnimator
      EffectivenessSoundAnimator
    ]

    conflicts = class_names.find_all { |n| ZVBattleUI.const_defined?(n) }.map { |n| "ZVBattleUI::#{n}" }
    raise "Name conflict with #{conflicts.join(', ')}" unless conflicts.empty?
  end
end.call
