proc do
  raise 'Name conflict with this plugin\'s Battle::Visual.zv_configure_hp_animation_handler' if
    Battle::Visual.method_defined?(:zv_configure_hp_animation_handler)

  if Object.const_defined?(:ZVBattleUI)
    class_names = %i[
      ShowHPAnimationHandler
      ShowHPAnimatorBase
      ShowHPAnimator
      ShowFakeHPAnimator
    ]

    name_conflicts = class_names.find_all { |n| ZVBattleUI.const_defined?(n) }.map { |n| "ZVBattleUI::#{n}" }
    raise "Name conflict with this plugin\'s #{name_conflicts.join(', ')}" unless name_conflicts.empty?
  end
end.call
