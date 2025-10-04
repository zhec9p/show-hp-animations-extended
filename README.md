# Show HP Animations Extended

## Description
This plugin overrides PSDK's `show_hp_animations` method with a more flexible version that enable multiple, separate plugins and monkey patches to add their own animations to the existing mix, as long as they adhere to the plugin's interfaces.

## Installation
1. Go to `scripts/ZVShowHPAnimationsExtended.psdkplug` in the appropiate branch in the repository. Then, in that page, click on a button that downloads the raw file.
2. Place `ZVShowHPAnimationsExtended.psdkplug` in `YOUR_PROJECT_ROOT/scripts`.
3. Open `YOUR_PROJECT_ROOT/cmd.bat`. This will bring up a command prompt.
4. In the command prompt, type `psdk --util=plugin load` and press Enter,

## Uninstallation
1. Delete `ZVShowHPAnimationsExtended.psdkplug` from `YOUR_PROJECT_ROOT/scripts`.
2. Open `YOUR_PROJECT_ROOT/cmd.bat`. Enter in `psdk --util=plugin load`,

## Dependencies
- None

## Credits
#### Plugin Creator
- zhec
