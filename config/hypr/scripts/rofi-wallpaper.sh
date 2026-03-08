#!/bin/bash

IMG_DIR="$HOME/pictures"

mapfile -t files < <(find "$IMG_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \))

names=()
for f in "${files[@]}"; do
    names+=("$(basename "$f")")
done

selected_name=$(printf '%s\n' "${names[@]}" | rofi -dmenu -i -p "swww >")

if [ -n "$selected_name" ]; then
    for i in "${!names[@]}"; do
        if [[ "${names[i]}" == "$selected_name" ]]; then
            select_image="${files[i]}"
            break
        fi
    done

    if [ -n "$select_image" ]; then
        swww img "$select_image" --transition-type any --transition-fps 50 --transition-duration 1
    fi
fi

