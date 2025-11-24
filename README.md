## NixOS + Hyprland конфигурация 

#### Софтваре:
os - nixos

wm - hyprland

shell - fish

terminal - foot

bar - waybar

editor - neovim

filemanager - yazi

#### Бинды:
SUPER + RETURN (ENTER) - вкл. терминал (foot)

SUPER + Q - выключить окно

SUPER + V - переключить режим окна

SUPER + X - переключить расположение окон

SUPER + F - фуллскрин окна

SUPER + M - выйти из сессии

SUPER + R - включить меню (rofi)

SUPER + W - включить/выключить waybar

SUPER + B - вкл. браузер (firefox)

SUPER + C - вкл. neovim

SUPER + H - вкл. btop

SUPER + O - вкл. virtualbox

SUPER + L - вкл. logseq (альтернатива obsidian)

SUPER + E - вкл. yazi

SUPER + G - вкл. GIMP

SUPER + T - вкл. telegram

Остальные бинды - стандартные (hypr/hyprland.conf)

#### Важно
Это очень сырая конфигурация, возможно в будущем приведу её в порядок. Пока что конфиги hypr не прописаны в .nix, и их приходится ставить отдельно (как и nvim, waybar и т.д).
