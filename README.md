# Show HP Animations Extended

## Description
This plugin replaces PSDK's `show_hp_animations` method with a more flexible version that enables multiple, separate plugins and monkey patches to add their own animations to the existing mix, as long as they adhere to the plugin's interfaces.

## Installation
1. Download `ZVShowHPAnimations.psdkplug` and `193208.csv` from the newest release in the **[Releases](https://github.com/zhec9p/show-hp-animations-extended/releases)** page.
2. Place `ZVShowHPAnimations.psdkplug` in `YOUR_PROJECT_ROOT/scripts`.
3. Open `YOUR_PROJECT_ROOT/cmd.bat`. This will bring up a command prompt.
4. In the command prompt, type `psdk --util=plugin load` and press Enter,

## Uninstallation
1. Delete `ZVShowHPAnimations.psdkplug` from `YOUR_PROJECT_ROOT/scripts`.
2. Open `YOUR_PROJECT_ROOT/cmd.bat`. Enter in `psdk --util=plugin load`, Enter "Y" when asked whether to remove the files added by the plugin.

## Dependencies
- None

## Credits
#### Plugin Creator
- zhec
