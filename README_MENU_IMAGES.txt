Pon Love Thao - menu image resources

The menu loads VideoStarTool_menu_background.jpg and VideoStarTool_menu_logo.png
from the same directory as the injected PonLoveThao.dylib. Keep all three files
together when using a manual injection workflow.

For Theos package builds, Makefile's after-stage rule also stages the two images
and PonLoveThao.plist beside the tweak dylib in the package payload.

This ZIP contains source code and image assets, not a precompiled dylib.
Build on macOS with Xcode command-line tools and Theos:
  export THEOS="$HOME/theos"
  ./build.sh

The runtime helper methods use private, version-dependent Video Star selectors.
They must be validated against the exact installed app version before relying
on automation. The multi-scene button intentionally opens the app's native UI
rather than reporting fake automated imports when no verified API is present.
