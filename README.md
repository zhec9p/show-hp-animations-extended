# Show HP Animations Extended for PSDK

## Description
This plugin reimplements PSDK's `show_hp_animations` method to make it possible for different plugins and monkey patches to add or remove animations to show when a battler's current HP goes up/down, without compatibility issues, as long as they use this plugin's interfaces and prepend `@zv_configure_hp_animation_handler` correctly.

See [Damaged Sprite Animation for PSDK](https://github.com/zhec9p/damaged-sprite-animation/) for an example.

## Installation
1. Go to [ZVShowHPAnimationsExtended.psdkplug](https://github.com/zhec9p/show-hp-animations-extended/blob/main/scripts/ZVShowHPAnimationsExtended.psdkplug) in the repository. Then, click on the download button for that file.
2. Place the downloaded .psdkplug file in the `scripts` subdirectory of your project's root folder.
3. Open the `cmd.bat` file located in your project's root folder. This will bring up a command prompt.
4. In the command prompt, type `psdk --util=plugin load` and press Enter.

## Uninstallation
1. Delete the .psdkplug file from the `scripts` subdirectory of your project's root folder.
2. Open the `cmd.bat` file located in your project's root folder. Enter in `psdk --util=plugin load`.

## Dependencies
- None

## Credits
- **Plugin Creator**: zhec



