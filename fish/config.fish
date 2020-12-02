if not test -f ~/.config/fish/functions/fisher.fish
    curl -sLo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
    fisher
end
