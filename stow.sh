# list=(zsh git tmux nvim ranger conda)
# for i in ${list[*]}; do
#     stow -t $HOME $i || exit -1
# done

list=(i3 i3status polybar alacritty ranger tmux)
for i in ${list[*]}; do
    stow -t $HOME/.config/$i $i || exit -1
done
