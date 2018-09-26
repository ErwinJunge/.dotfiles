if not test -f ~/.config/fish/functions/fisher.fish
    curl -sLo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
    fisher
end
eval (/usr/bin/python -m virtualfish auto_activation compat_aliases)
