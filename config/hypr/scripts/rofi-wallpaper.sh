#!/bin/bash

IMG_DIR="$HOME/pictures"

# Lista os arquivos com caminho completo
mapfile -t files < <(find "$IMG_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \))

# Extrai só os nomes dos arquivos para mostrar no rofi
names=()
for f in "${files[@]}"; do
    names+=("$(basename "$f")")
done

# Mostra só os nomes no rofi
selected_name=$(printf '%s\n' "${names[@]}" | rofi -dmenu -i -p "swww >")

# Se selecionou, acha o caminho completo correspondente ao nome escolhido
if [ -n "$selected_name" ]; then
    # Busca o arquivo completo com base no nome selecionado
    for i in "${!names[@]}"; do
        if [[ "${names[i]}" == "$selected_name" ]]; then
            select_image="${files[i]}"
            break
        fi
    done

    # Aplica como wallpaper
    if [ -n "$select_image" ]; then
        swww img "$select_image" --transition-type any --transition-fps 50 --transition-duration 1
    fi
fi

