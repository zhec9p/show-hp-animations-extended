module Battle
  class Visual
    # Configure the HP animation handler
    def zv_configure_hp_animation_handler
      @show_hp_animators = ZVBattleUI::ShowHPAnimationHandler.new
      @show_hp_animators.add(ZVBattleUI::ShowHPAnimator.new(@scene))
      @show_hp_animators.add(ZVBattleUI::ShowFakeHPAnimator.new(@scene))
    end

    module ZVShowHPAnimationExtended
      def initialize(...)
        super
        zv_configure_hp_animation_handler
      end

      def show_hp_animations(targets, hps, effectiveness = [], **others, &messages)
        log_data("hps: #{hps}")
        lock do
          wait_for_animation

          animations = targets.map.with_index do |target, index|
            show_info_bar(target)
            hp = hps[index]
            next [] if hp.nil?

            other = others.transform_values { |args| args[index] }
            next @show_hp_animators.create_animations(target, hp, effectiveness[index], **other)
          end

          animations.flatten!
          scene_update_proc { animations.each(&:update) } until animations.all?(&:done?)
          messages&.call
          show_kos(targets)
        end
      end
    end
    prepend ZVShowHPAnimationExtended
  end

  module VisualMock
    module ZVShowHPAnimationExtendedMock
      def show_hp_animations(targets, hps, effectiveness = [], **others, &messages)
        super(targets, hps, effectiveness, &messages)
      end
    end
    prepend ZVShowHPAnimationExtendedMock
  end
end

