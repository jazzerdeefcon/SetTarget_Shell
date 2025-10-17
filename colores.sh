#!/bin/bash

clear
RESET='\e[0m'

# Atributos ANSI que vamos a probar
# 0 = normal, 1 = brillante/negrita, 2 = tenue, 3 = cursiva, 4 = subrayado, 5 = parpadeo
for attr in 0 1 2 3 4 5; do
    echo -e "\n=== Atributo $attr ==="
    
    for code in $(seq 0 119); do
        # Aplica el atributo y el código
        printf "\e[${attr};${code}m %3d \e[0m " "$code"
        
        # Salto de línea cada 10 códigos para que quede tabla
        if (( code % 10 == 9 )); then
            echo
        fi
    done
done

echo -e "\n$RESET"

