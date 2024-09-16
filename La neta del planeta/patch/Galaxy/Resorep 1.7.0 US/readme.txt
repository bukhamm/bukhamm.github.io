You may ask questions or report issues here: https://www.undertow.club/threads/tool-resorep-directx-11-texture-replacer.8402/

Usage instructions:

For mod users:

    Download and install Microsoft Visual C++ 2015 Redistributable
    Download and install Windows x64 (!) version of Java Runtime Environment from http://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html
    Launch resorep.jar - double click it in Windows Explorer.
    Make sure that your Windows user has write rights for game folder!
    Click the "Add application" button in the "Applications to hook" section.
    Choose the game executable. Not the game launcher but game itself.
    [Optional] Change "Modded textures folder" path if you wish.
    You may close the resorep.jar application now.
    Find and download some mods for your game.
    Unpack and copy modded textures into folder specified by "Modded textures folder" path.
    Launch the game.

For modders:

    Download and install Microsoft Visual C++ 2015 Redistributable
    Download and install Windows x64 (!) version of Java Runtime Environment from http://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html
    Launch resorep.jar - double click it in Windows Explorer.
    Make sure that your Windows user has write rights for game folder!
    Click the "Add application" button in the "Applications to hook" section.
    Choose the game executable. Not the game launcher but game itself.
    Open Advanced settings in Resorep.
    Enable mod creator mode.
    [Optional] Change "Save original textures to" path if you wish.
    Launch the game.
    To reduce amount of captured textures, wait for the moment when the texture you are going to mod is about to be displayed for the first time.
    Enable the "Save original textures to" checkbox when the texture you are going to mod is about to be displayed for the first time.
    Disable the "Save original textures to" checkbox when the texture you are going to mod was displayed in-game.
    Open folder specified in "Save original textures to".
    Find a texture you are going to mod in one of the subfolders. There are different subfolders for different texture compression algorithms.
    Mod the texture (use Photoshop with Intel(R) DDS plugin - https://software.intel.com/en-us/articles/intel-texture-works-plugin). You may change the texture resolution as long as you keep the aspect ratio.
    Save the texture to other folder using the same compression algorithm and with mipmaps setting set to "Generate mipmaps". (Check "For modders" folder for Intel DDS plugin settings guide)
    Do not delete the original unmodded dds! It may be required later to autoupdate your modded textures in case of Resorep hashing algorithm change.
    Now when you have the modded texture - use steps from the "For mod users" section.