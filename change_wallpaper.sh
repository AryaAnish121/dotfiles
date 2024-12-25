if [ -z "$1" ]; then
    echo "Error: Please provide a wallpaper file as an argument."
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: File not found: $1"
    exit 1
fi

hyprpaper_config_file="$HOME/.config/hypr/hyprpaper.conf"
sed -i -e "s|^preload = .*$|preload = $1|" \
       -e "s|^wallpaper = .*$|wallpaper = ,$1|" \
       "$hyprpaper_config_file"

# Reload hyprpaper
killall hyprpaper
sleep .1;
hyprpaper &

wal -i $1

sleep .1;
mv $HOME/.cache/wal/cava-config $HOME/.config/cava/config


# Let the user know it's done
echo "Wallpaper settings in hyprpaper.conf updated successfully."