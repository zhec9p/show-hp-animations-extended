module Battle
  class Visual
    module ZVShowHPAnimationExtendedVisual
      def initialize(...)
        super
        @zv_hp_animators = ZVBattleUI::ShowHPAnimationHandler.new
        zv_configure_hp_animation_handler
      end
    end
    prepend ZVShowHPAnimationExtendedVisual

    # Configure the HP animation handler
    def zv_configure_hp_animation_handler
      @zv_hp_animators.add(ZVBattleUI::EffectivenessSoundAnimator.new)
      @zv_hp_animators.add(ZVBattleUI::HPAnimator.new(@scene))
      @zv_hp_animators.add(ZVBattleUI::FakeHPAnimator.new(@scene))
    end

    def show_hp_animations(targets, hps, effectiveness = [], **others, &messages)
      lock do
        wait_for_animation

        animations = targets.map.with_index do |target, idx|
          show_info_bar(target)
          hp_at_idx = hps[idx]
          next [] if hp_at_idx.nil?

          others_at_idx = others.transform_values { |values| values[idx] }
          next @zv_hp_animators.create_animations(target, hp_at_idx, effectiveness[idx], **others_at_idx)
        end

        animations.flatten!
        animations.each(&:start) # Ensuring that all animations start as close to each other as possible
        scene_update_proc { animations.each(&:update) } until animations.all?(&:done?)
        messages&.call
        show_kos(targets)
      end
    end
  end

  module VisualMock
    module ZVShowHPAnimationExtendedVisualMock
      def show_hp_animations(targets, hps, effectiveness = [], **others, &messages)
        super(targets, hps, effectiveness, &messages)
      end
    end
    prepend ZVShowHPAnimationExtendedVisualMock
  end
end
