# AutoBspwm
Consigue mi entorno de trabajo basado en Bspwm. Simplifica, y obtén un entorno más bueno para el hacking ético. Con todas las herramientas necesarias incluidas, este script automatiza el hecho de instalar todo lo que necesites además de tener un entorno GOOD.

### Funcional en Kali Linux. Podría funcionar en Parrot OS y Ubuntu también.

![imagen](https://github.com/OusCyb3rH4ck/AutoBspwm/assets/158448818/986bff1f-7231-4254-8fe9-da5a06cabc4f)
![imagen](https://github.com/OusCyb3rH4ck/AutoBspwm/assets/158448818/d108c5f8-4b8e-4d89-bb20-a43748c95e01)


## Atajos (Shortcuts) del sistema
- `WIN + Enter` Abrir Terminal (Kitty)
- `WIN + d` Abrir lanzador de programas (Rofi)
- `WIN + SHIFT + f` Abrir Firefox
- `WIN + SHIFT + b` Abrir BurpSuite
- `WIN + SHIFT + v` Abrir VS Code
- `SHIFT + f` Abrir FlameShot (Herramienta para realizar capturas)
- `WIN + ESPACIO` Alternar entre el teclado ESPAÑOL y FRANCÉS
- `WIN + l` Bloquear la sesión actual
- `WIN + SHIFT + e` Abrir Edge (A instalar por cuenta propia)
- `WIN + SHIFT + g` Abrir Google Chrome (A instalar por cuenta propia)
## 
- `WIN + SHIFT + [1, 2, 3, 4, 5, 6]` Cambiar de escritorio
- `WIN + CTRL + SHIFT + [1, 2, 3, 4, 5, 6]` Mover la ventana actual a otro escritorio
- `WIN + ESC` Aplicar cambios de la SXHKD
- `WIN + SHIFT + r` Reiniciar la BSPWM (en caso de cambios en la BSPWMRC o POLYBAR)
- `WIN + q` o `WIN + SHIFT + q` Cerrar ventana (y programa)
- `WIN + m` Alternar entre el diseño en mosaico y el diseño monocle
- `WIN + g` Intercambiar el nodo actual y la ventana más grande
- `WIN + t` Ajustar la ventana al margen
- `WIN + f` Maximizar ventana (a pantalla completa)
- `WIN + s` Minimizar ventana
- `CTRL + WIN + [Teclas arriba, abajo, izquierda, derecha]` Mover la ventana (Con la ventana minimizada [WIN + s])
- `ALT + WIN + [Teclas arriba, abajo, izquierda, derecha]` Cambiar tamaño de la ventana según tus necesidades (Con la ventana minimizada [WIN + s])

## Atajos (ShortCuts) de la Terminal (Kitty)
- `WIN + Enter` Abrir Terminal (Kitty)
- `CTRL + SHIFT + t` Abrir nueva pestaña
- `CTRL + SHIFT + Enter` Abrir nueva terminal en la misma pestaña
- `CTRL + SHIFT + ALT + t` Renombrar pestaña
- `CTRL + SHIFT + [COMA "," | PUNTO "."]` Mover pestaña a la izquierda o derecha
- `CTRL + SHIFT + z` Maximizar la terminal actual (En caso de tener otra terminal en la misma pestaña, por si acaso)
- `CTRL + SHIFT + r` Ajustar la terminal actual (En caso de tener otra terminal en la misma pestaña, por si acaso)
- `CTRL + [Teclas arriba, abajo, izquierda, derecha]` Moverse entre terminales de la misma pestaña
## 
- `ESC + ESC (RÁPIDAMENTE)` Poner la palabra "sudo" al principio (Útil en caso de querer usar root para un comando ya escrito)
- `CTRL + l` Vaciar la terminal actual
- `CTRL + r` Ver el histórico de comandos escritos anteriormente
- `CTRL + t` Buscar archivos y directorios de forma recursiva partiendo del directorio actual
- `F1` Copiar selección al portapapeles (Búfer 1)
- `F2` Pegar selección del búfer 1
- `F3` Copiar selección al portapapeles (Búfer 2)
- `F4` Pegar selección del búfer 2
- `F5` Copiar selección al portapapeles (Búfer 3)
- `F6` Pegar selección del búfer 3

## Instalación & Úso (¡¡¡LEER ATENTIVAMENTE!!!)
![imagen](https://github.com/OusCyb3rH4ck/AutoBspwm/assets/158448818/4d414986-e6ef-46dd-b81a-7b282430bff9)

- Cambia el propietario del directorio "/opt" a tu usuario normal con `sudo chown -R usuario:usuario /opt` (Cambia "usuario" por tu usuario)
- Clona el repositorio en el directorio "/opt" con `git clone https://github.com/OusCyb3rH4ck/AutoBspwm /opt/AutoBspwm`
- Ejecuta `cd /opt/AutoBspwm` para moverte al directorio
- EJECUTA ESTE COMANDO (¡ES OBLIGATORIO E IMPORTANTE, SINO NO FUNCIONARÁ!) `find . -type f -print0 | xargs -0 sed -i 's/ouscyb3rh4ck/usuario/g'` (Cambia "usuario" por tu usuario)
- Luego, ejecuta `chmod +x AutoBspwm.sh`
- Y finalmente `./AutoBspwm.sh` (NO LO EJECUTES COMO ROOT, SINO VA A PETAR)
