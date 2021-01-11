# https://github.com/jorgebucaran/fisher#changing-the-installation-prefix
set -g fisher_path ~/.config/fish/fisher
plugin_load $fisher_path

set pure_symbol_prompt (set_color red)❯(set_color yellow)❯(set_color green)❯(set_color normal)
