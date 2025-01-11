#!/bin/bash

continueMessage() {
    echo "Press any key to continue..."
}

echo "---------------------------------------------"
echo "Manual settings change"
echo "---------------------------------------------"

echo "1/6 Battery"
echo "Go to [Battery] and set [Low power mode] to [Only on Battery]"
continueMessage

echo "2/6 Accessibility Zoom"
echo "Go to [Accessibility > Zoom] and set [Modifier key for scroll gesture] to [Option]"
continueMessage

echo "3/6 Control Center"
echo "Go to [Control Center] and make DONT SHOW [Blutooth, AirDrop, StageManager]"
echo "Go to [Control Center > Battery] and check all options"
echo "Go to [Control Center > Menu Bar Only] and uncheck all options"
continueMessage

echo "4/6 Lock Screen"
echo "Go to [Lock Screen] and set [Start Screen Saver when inactive] to [never]"
echo "Go to [Lock Screen] and set [Turn dispay off on battery when inactive] to [For 2 minutes]"
echo "Go to [Lock Screen] and set [Turn dispay off on power adapter when inactive] to [For 10 minutes]"
echo "Go to [Lock Screen] and set [Require password after screen saver beg...] to [immediately]"
continueMessage

echo "5/6 Keyboard"
echo "Go to [Keyboard] and set [Key repeat rate] to [Fast]"
echo "Go to [Keyboard] and set [Delay until repeat] to [Short]"
echo "Go to [Keyboard > Shortcuts > Screenshots] and uncheck first 2 options and last 1 option"
echo "Go to [Keyboard > Shortcuts > Screenshots] and set [Save picture of selected area as a file] to [Shift-Ctrl-\`]"
echo "Go to [Keyboard > Shortcuts > Screenshots] and set [Copy picture of selected area to the clipboard] to [Shift-Ctrl-\`]"
echo "Go to [Keyboard > Shortcuts > Modifier Keys] and set [Caps Lock] to [Control]"
continueMessage

echo "6/6 Trackpad"
echo "Go to [Trackpad] and set [Tracking speed] to [Middle - 1]"
echo "Go to [Trackpad] and set [Click] to [Light]"
continueMessage

echo "---------------------------------------------"
echo "Install Homebrew"
echo "---------------------------------------------"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "---------------------------------------------"
echo "Install CLI tools"
echo "---------------------------------------------"
brew install bat eza ffmpeg fzf git lazygit lua-language-server neovim neofetch node parallel readline ripgrep s3cmd sevenzip tree-sitter yazi zoxide docker

echo "---------------------------------------------"
echo "Install GUI apps, fonts"
echo "---------------------------------------------"
brew --cask aerospace kitty telegram steam font-meslo-lg-nerd-font font-symbols-only-nerd-font discord

echo "---------------------------------------------"
echo "Clone dotfiles"
echo "---------------------------------------------"
git clone https://github.com/hard-tender-blade/dotfiles.git ~/.config

echo "---------------------------------------------"
echo "Restore defaults"
echo "---------------------------------------------"
chmod +x ~/.config/scripts/import_defaults.sh  
chmod +x ~/.config/scripts/export_defaults.sh # make the script executable for the future 
bash ~/.config/scripts/import_defaults.sh 
killall SystemUIServer
killall Dock

echo "---------------------------------------------"
echo "Install NPM packages (mostly language servers for neovim)"
echo "---------------------------------------------"
npm i -g @olrtg/emmet-language-server @tailwindcss/language-server bash-language-server dockerfile-language-server-nodejs typescript-language-server typescript vscode-langservers-extracted

echo "---------------------------------------------"
echo "Finished setup"
echo "---------------------------------------------"

