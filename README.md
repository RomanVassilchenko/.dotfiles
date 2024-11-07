<h1 align="center">
   <img src="./.github/assets/logo/nixos-logo.png" width="100px" />
   <img src="./.github/assets/logo/macos-logo.png" width="100px" />
   <br>
   Roman Vassilchenko's Dotfiles
   <!-- <br>
   <img src="./.github/assets/pallet/pallet-0.png" width="600px" /> -->
</h1>

<div align="center">
   <p></p>
   <!-- <a href="https://github.com/RomanVassilchenko/.dotfiles/stargazers">
      <img src="https://img.shields.io/github/stars/RomanVassilchenko/.dotfiles?color=FABD2F&labelColor=282828&style=for-the-badge&logo=starship&logoColor=FABD2F">
   </a> -->
   <a href="https://github.com/RomanVassilchenko/.dotfiles/">
      <img src="https://img.shields.io/github/repo-size/RomanVassilchenko/.dotfiles?color=B16286&labelColor=282828&style=for-the-badge&logo=github&logoColor=B16286">
   </a>
   <a href="https://nixos.org">
      <img src="https://img.shields.io/badge/NixOS-unstable-blue.svg?style=for-the-badge&labelColor=282828&logo=NixOS&logoColor=458588&color=458588">
   </a>
   <a href="https://github.com/RomanVassilchenko/.dotfiles/blob/main/LICENSE">
      <img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&colorA=282828&colorB=98971A&logo=unlicense&logoColor=98971A"/>
   </a>
</div>

<!-- ### 🖼️ Gallery

<p align="center">
   <img src="./.github/assets/screenshots/1.png" style="margin-bottom: 10px;" /> <br>
   <img src="./.github/assets/screenshots/2.png" style="margin-bottom: 10px;" /> <br>
   <img src="./.github/assets/screenshots/3.png" style="margin-bottom: 10px;" /> <br>
   Screenshots last updated <b>2024-11-02</b>
</p> -->

<!-- --- -->

# 🗃️ Overview

This repository contains my personal dotfiles and configurations for NixOS and macOS (Darwin) systems, using Nix flakes and `home-manager` to ensure a smooth and unified setup across both platforms.

## 📚 Layout

- **flake.nix** - The main entry point for configuration across systems.
- **hosts** - Host-specific configurations for each OS:
  - **NixOS** - Configurations for my NixOS setup.
  - **Darwin** - macOS-specific configurations using `nix-darwin`.
- **modules** - Modular configurations organized by functionality:
  - **core** - Core configurations and settings.
  - **home** - Settings managed through `home-manager`.
  - **darwin** - macOS-specific configurations.
  - **nixos** - NixOS-specific configurations.

---

<!-- ## 📓 Components

| Component                     | NixOS Configuration          | macOS (Darwin) Configuration         |
| ----------------------------- | ---------------------------- | ------------------------------------ |
| **🎛️ Window Manager**         | Hyprland                     | macOS default window manager        |
| **📊 Status Bar**             | Waybar                       | macOS Menu Bar                      |
| **🚀 Application Launcher**   | Rofi                         | Raycast                           |
| **🔔 Notifications**          | Swaync                       | macOS Notification Center           |
| **💻 Terminal**               | Kitty                        | iTerm2 + Kitty                    |
| **🐚 Shell**                  | Zsh + oh-my-zsh + Starship   | Zsh + oh-my-zsh + Starship          |
| **📝 Text Editor**            | Neovim, VSCode               | Neovim, VS Code                     |
| **📈 System Monitor**         | Btop                         | Btop + Activity Monitor                    |
| **📂 File Manager**           | Nemo                         | Finder                              |
| **🔠 Fonts**                  | JetBrainsMono Nerd, CascadiaCode Nerd | Same as NixOS                       |
| **🎨 Theme**                  | Gruvbox Dark Hard            | Gruvbox Dark (in supported apps)    |
| **🖱️ Cursor**                 | Bibata-Modern-Ice            | macOS Default                       |
| **📁 Icons**                  | Papirus-Dark                 | macOS Default                       |
| **🔒 Lockscreen**             | Hyprlock, Swaylock-effects   | macOS Lock Screen                   |
| **🖼️ Image Viewer**           | qview                        | Preview                             |
| **🎶 Music Player**           | Audacious                    | Apple Music, Spotify                |
| **📷 Screenshot Tool**        | Grimblast                    | macOS Screenshot Utility            |
| **📋 Clipboard Manager**      | wl-clip-persist              | macOS Universal Clipboard           |
| **🌈 Color Picker**           | hyprpicker                   | macOS Color Picker                  |

--- -->

## 📝 Shell Aliases

<details>
<summary>
Utility Aliases (Expand)
</summary>

- `c` ➔ `clear`
- `cd` ➔ `z`
- `tt` ➔ `gtrash put`
- `vim` ➔ `nvim`
- `cat` ➔ `bat`
- `nano` ➔ `micro`
- `py` ➔ `python`
- `dsize` ➔ `du -hs`
- `pdf` ➔ `tdf`
- `open` ➔ `xdg-open`
- `space` ➔ `ncdu`
- `man` ➔ `BAT_THEME='default' batman`
- `l` ➔ `eza --icons -a --group-directories-first -1`
- `ll` ➔ `eza --icons -a --group-directories-first -1 --no-user --long`
- `tree` ➔ `eza --icons --tree --group-directories-first`

</details>

<details>
<summary>
NixOS Specific Aliases (Expand)
</summary>

- `cdnix` ➔ `cd ~/.dotfiles && code ~/.dotfiles`
- `ns` ➔ `nom-shell --run zsh`
- `nix-test` ➔ `nh os test`
- `nix-switch` ➔ `nh os switch`
- `nix-update` ➔ `nh os switch --update`
- `nix-clean` ➔ `nh clean all --keep 5`
- `nix-search` ➔ `nh search`

</details>

<details>
<summary>
Git Aliases (Expand)
</summary>

- `g` ➔ `lazygit`
- `gf` ➔ `onefetch --number-of-file-churns 0 --no-color-palette`
- `ga` ➔ `git add`
- `gaa` ➔ `git add --all`
- `gs` ➔ `git status`
- `gb` ➔ `git branch`
- `gm` ➔ `git merge`
- `gd` ➔ `git diff`
- `gpl` ➔ `git pull`
- `gps` ➔ `git push`
- `gc` ➔ `git commit`
- `gcm` ➔ `git commit -m`
- `glol` ➔ `git log --graph`
  
</details>

<!-- ---

## 🛠️ Scripts

All custom scripts are located in `modules/home/scripts/scripts/` and can be accessed as packages in `modules/home/scripts/default.nix`.

<details>
<summary>
toggle_blur.sh
</summary>

**Description:** Toggles the blur effect in Hyprland.

**Usage:** `toggle_blur`
</details>

<details>
<summary>
toggle_opacity.sh
</summary>

**Description:** Adjusts window opacity between two preset levels.

**Usage:** `toggle_opacity`
</details>

<details>
<summary>
compress.sh
</summary>

**Description:** Compresses files/folders into `.tar.gz` format.

**Usage:** `compress <file/folder>`
</details>

--- -->

<!-- ## ⌨️ Keybinds

Press `$mainMod + F1` to view all keybindings. By default, `$mainMod` is the `SUPER` key.

<details>
<summary>
Keybindings
</summary>

- `$mainMod + Return` ➔ Launch Wezterm
- `$mainMod + Space` ➔ Toggle floating window
- `$mainMod + D` ➔ Launch Rofi
- `$mainMod + F` ➔ Toggle fullscreen

</details>

---

# 🚀 Installation

> **CAUTION**: Review configurations and scripts before applying, as custom settings can impact your OS behavior.

## 1. Install Nix

### For NixOS

Use any [graphical ISO image](https://nixos.org/download.html#nixos-iso). Only the Gnome installer (no desktop option) has been tested.

### For macOS (Darwin)

Install `nix-darwin`:

```bash
nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
./result/bin/darwin-installer
```

## 2. Clone and Apply Configurations

```bash
git clone https://github.com/RomanVassilchenko/.dotfiles
cd ~/.dotfiles
```

### For macOS

```bash
nix build .#darwinConfigurations.mbp-rovasilchenko-OZON-W0HDJTC2M5.system
./result/sw/bin/darwin-rebuild switch --flake .
```

### For NixOS

```bash
sudo nixos-rebuild switch --flake .
```

--- -->

<p align="center"><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true" /></p>

<div align="right">
  <a href="#readme">Back to the Top</a>
</div>
```
