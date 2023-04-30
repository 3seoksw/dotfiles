# dotfiles
<img width="2560" alt="full-screenshot" src="https://user-images.githubusercontent.com/97219959/235214851-9e06362d-d5c5-46e2-aaac-47bbb43302a9.png">

# Contents 🥞
- [yabai 🪟](#yabai)
- [SketckyBar 🎨](#sketchybar)
- [LunarVim 🌙](#lunarvim)

## yabai
[yabai](https://github.com/koekeishiya/yabai) is a window management utility for macOS.
For better understanding, I recommend you to look for the official documentation ([yabai Wiki](https://github.com/koekeishiya/yabai/wiki)).

### Installation
```
brew install koekeishiya/formulae/yabai
brew services start yabai
```

I use [skhd](https://github.com/koekeishiya/skhd) to map yabai commands. In order to tile windows using yabai with certain keymaps, skhd is a great option you might want to consider.
```
brew install koekeishiya/formulae/skhd
brew services start skhd
```

### Setup
Create files as such:
`$HOME/.config/yabai/yabairc` and `$HOME/.config/skhd/skhdrc`.

Then customize it yourself or you can simply copy and paste my settings.

## SketchyBar
<img width="2560" alt="sketchybar" src="https://user-images.githubusercontent.com/97219959/235213581-270e5e35-1055-4aae-8acc-70ce77a16177.png">

### Preview
- Currently running applications information per spaces 

<img width="520" alt="bar_1" src="https://user-images.githubusercontent.com/97219959/235318936-ca32df3d-7797-4356-bc7b-153f4cb0e47e.png">

- Playing music information
- Battery information
- Volume information
- WiFi information
- Date information

<img width="678" alt="bar_2" src="https://user-images.githubusercontent.com/97219959/235318938-ee8ab3be-6c08-4e18-ad44-ee17682ed481.png">

- Popup menu with the choices of
    - System Preferences
    - Activity Monitor
    - Lock Screen

<img width="517" alt="bar_popped" src="https://user-images.githubusercontent.com/97219959/235318940-544c1168-72d2-44f4-8958-3b1d22bbd3f4.png">

### Installation
```
brew tap FelixKratz/formulae
brew install sketchybar
```

### Setup
- Fonts (`sf-symbols`, `jetbrains-mono`, [`sketchybar-app-font`](https://github.com/kvndrsslr/sketchybar-app-font))
```
brew tap homebrew/cask-fonts
brew install --cask sf-symbols 
brew install --cask font-jetbrains-mono
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.4/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf
```

## LunarVim
