fundle plugin 'rafaelrinaldi/pure'
fundle init

# Aliases
alias n="nvim"

# THEME PURE #
set fish_function_path /home/mike/.config/fish/functions/theme-pure/functions/ $fish_function_path
source /home/mike/.config/fish/functions/theme-pure/conf.d/pure.fish

# set -g pure_symbol_prompt "🐙"
# set -g pure_symbol_prompt "🐋"
set -g pure_symbol_prompt '$' 
