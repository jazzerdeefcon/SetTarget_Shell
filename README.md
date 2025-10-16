
# SetTarget — función de terminal

**SetTarget** — función shell ligera para gestionar un *target* desde la terminal mostrando IP y nombre de máquina directamente encima del prompt. Ideal si no usas Polybar o quieres un prompt informativo rápido.

---

## Contenido del repositorio

- `settarget` / `SetTarget_Shell` — script/función principal.  
- `README.md` — documentación (este archivo).  
- `LICENSE` — licencia CC0-1.0 (dominio público).

---

## Qué hace

- Guarda un `target` (IP y nombre) en `~/.config/bin/target`.  
- Muestra el `target` como una línea sobre el prompt (compatible con **bash** y **zsh**).  
- Proporciona funciones para establecer, limpiar y mostrar el target: `settarget`, `cleartarget`, `show_target`.

---

## Requisitos

- Linux (probado en Debian/Parrot/Arch).  
- Shell: **bash** o **zsh**.  
- No requiere dependencias externas.

---

## Instalación

Clona el repositorio y carga la función en tu shell:

bash
```shell
 git clone https://github.com/jazzerdeefcon/SetTarget_Shell 
cd SetTarget_Shell
 ```

### Crea el directorio si no lo tienes) 

 `~/.config/bin/target`.
 
### Agregar la funcion a ~/.bashrc ó ~/.zshrc
Si no sabes que shell tienes, puedes usar el comando
 `echo $SHELL`
 
 Sabiendo cual es tu terminal, pon el comando:
 
#### Bash
`echo "/ruta/a/SetTarget_Shell/settarget" >> ~/.bashrc`
#### Zsh
`echo "/ruta/a/SetTarget_Shell/settarget" >> ~/.zshrc`
( O haz un `cat  settarget` y copia la función hasta abajo de tu archivo de la shell .bashrc o .zshrc )

### luego recarga la terminal

`source ~/.bashrc`
ó
`source ~/.zshrc`

---
## Uso 
### Establecer un target
`settarget IP_OBJETIVO NOMBRE_DE_LA_MAQUINA`
(ejemplo:)
`settarget 10.2.0.15 HackNet`

Ese comando guarda `'10.2.0.15 HackNet'` en `~/.config/bin/target` y el prompt mostrará:

```
[10.2.0.15 - HackNet]
TuUsuario@host:~$
```

---
### Limpiar el target

`cleartarget`

Eso elimina el contenido de `~/.config/bin/target` y quita la línea del target del prompt.

### Mostrar el target manualmente

`show_target`

Eso imprime `[IP - nombre]` si existe el archivo de target.

---

## Ejemplos de Personalización:

#para bash
  ```
  if [ -n "$BASH_VERSION" ]; then
    PS1='$(show_target)\n\[\e[1;32m\]\u@\h\[\e[0m\]:\w\$ '
fi

#para zsh
if [ -n "$ZSH_VERSION" ]; then
    PROMPT='$(show_target)
%F{green}%n@%m%f:%~$ '
fi
```

## Se veria asi:

```
[10.10.10.21 - HackNet]
TuUser@parrot:~/hacklab$
```

## Quitando `@\h` en Bash ó  `@%m` en ZSH se veria asi:

`[10.10.10.21 - HackNet]`
`TuUser:~/hacklab$`

---
![Texto alternativo](./settarget.png)


## Integración práctica (ejemplos)

Usar el target en comandos:

`# leer variables  read ip name < ~/.config/bin/target # ssh al target ssh "$ip" # nmap rápido nmap -sC -sV "$ip"` 

Crear alias/wrappers útiles:

```
# alias para ssh si existe target st-ssh() { if [ -f ~/.config/bin/target ]; then  read ip name < ~/.config/bin/target
    ssh "$ip" else  echo  "No hay target definido."  fi }
```



## Contribuciones

Si quieres mejorar la función (validaciones, soporte para más campos, integración con Polybar, wrappers):

1.  Forkea el repo.
    
2.  Crea una rama: `git checkout -b feat/nombre`.
    
3.  Haz commits claros.
    
4.  Abre un Pull Request describiendo los cambios.

---
## Changelog

-   **v0.1** — Versión inicial: `settarget`, `cleartarget`, `show_target`, integración básica con Bash y Zsh.
- 
- ## Créditos / Autor

Autor: `D3FC0N` https://github.com/jazzerdeefcon`.
