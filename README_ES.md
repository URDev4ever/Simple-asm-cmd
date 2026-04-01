<p align="center">
  🇺🇸 <a href="README.md"><b>English</b></a> |
  🇪🇸 <a href="README_ES.md">Español</a>
</p>

# Comando `ASM` Simple

Pequeño helper de shell para **ensamblar, linkear y ejecutar programas en Assembly rápidamente** desde la terminal.

En lugar de ejecutar `nasm` y `ld` manualmente cada vez, esta función ensambla un archivo `.asm`, lo linkea y ejecuta inmediatamente el binario resultante.

## Uso

```bash id="2q8m1n"
asm program.asm
```

Esto hará:

1. Ensamblar el archivo con `nasm`
2. Generar un archivo objeto (`.o`)
3. Linkearlo usando `ld`
4. Ejecutar el binario compilado

Ejemplo:

```bash id="1y8h2g"
asm hello.asm
```

---

# Requisitos

Necesitás:

* **nasm**
* **ld** (generalmente incluido en `binutils`)
* una **shell POSIX** (bash / zsh)

Instalá las dependencias si no las tenés.

### Debian / Ubuntu / Kali

```bash id="s0m2n8"
sudo apt install nasm binutils
```

### Arch Linux

```bash id="r7k3d1"
sudo pacman -S nasm binutils
```

### Fedora

```bash id="v9c4x6"
sudo dnf install nasm binutils
```

---

# Instalación

## Opción 1 — Agregar a la configuración de tu shell (recomendado)

Copiá la función dentro de tu archivo de configuración de shell.

Para **bash**:

```bash id="e3b7k9"
~/.bashrc
```

Para **zsh**:

```bash id="t5m1q2"
~/.zshrc
```

Luego pegá:

```bash id="p8z4n6"
asm() {
    local file="$1"

    if [[ -z "$file" ]]; then
        echo "Usage: asm file.asm"
        return 1
    fi

    if [[ ! -f "$file" ]]; then
        echo "File not found"
        return 1
    fi

    local name="${file%.asm}"

    nasm -f elf64 -o "$name.o" "$file" &&
    ld -o "$name" "$name.o" &&
    "./$name"
}
```

Recargá tu shell:

```bash id="k2x9w1"
source ~/.zshrc
```

o

```bash id="d6n3p8"
source ~/.bashrc
```

---

## Opción 2 — Instalar como comando en el PATH

Creá un script:

```bash id="h1v8c5"
sudo nano /usr/local/bin/asm
```

Pegá:

```bash id="u4r7m2"
#!/usr/bin/env bash

file="$1"

[ -z "$file" ] && echo "Usage: asm file.asm" && exit 1
[ ! -f "$file" ] && echo "File not found" && exit 1

name="${file%.asm}"

nasm -f elf64 -o "$name.o" "$file" &&
ld -o "$name" "$name.o" &&
"./$name"
```

Hacelo ejecutable:

```bash id="w9p3q7"
sudo chmod +x /usr/local/bin/asm
```

Ahora podés ejecutar:

```bash id="z8m2k4"
asm program.asm
```

desde cualquier lugar.

---

# ¿Por qué?

Solo una pequeña utilidad para eliminar fricción al experimentar con programas en Assembly.

Ensamblar → linkear → ejecutar → repetir.

---

Hecho con <3 por URDev.
