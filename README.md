<p align="center">
  🇺🇸 <a href="README.md"><b>English</b></a> |
  🇪🇸 <a href="README_ES.md">Español</a>
</p>

# Simple `ASM` Command

Small shell helper to **assemble, link and run Assembly programs quickly** from the terminal.

Instead of running `nasm` and `ld` manually every time, this function assembles a `.asm` file, links it, and immediately executes the resulting binary.

## Usage

```bash
asm program.asm
```

This will:

1. Assemble the file with `nasm`
2. Generate an object file (`.o`)
3. Link it using `ld`
4. Run the compiled binary

Example:

```bash
asm hello.asm
```

---

# Requirements

You need:

* **nasm**
* **ld** (usually included with `binutils`)
* a **POSIX shell** (bash / zsh)

Install dependencies if you don't have them.

### Debian / Ubuntu / Kali

```bash
sudo apt install nasm binutils
```

### Arch Linux

```bash
sudo pacman -S nasm binutils
```

### Fedora

```bash
sudo dnf install nasm binutils
```

---

# Installation

## Option 1 — Add to your shell config (recommended)

Copy the function into your shell config file.

For **bash**:

```bash
~/.bashrc
```

For **zsh**:

```bash
~/.zshrc
```

Then paste:

```bash
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

Reload your shell:

```bash
source ~/.zshrc
```

or

```bash
source ~/.bashrc
```

---

## Option 2 — Install as a command in PATH

Create a script:

```bash
sudo nano /usr/local/bin/asm
```

Paste:

```bash
#!/usr/bin/env bash

file="$1"

[ -z "$file" ] && echo "Usage: asm file.asm" && exit 1
[ ! -f "$file" ] && echo "File not found" && exit 1

name="${file%.asm}"

nasm -f elf64 -o "$name.o" "$file" &&
ld -o "$name" "$name.o" &&
"./$name"
```

Make it executable:

```bash
sudo chmod +x /usr/local/bin/asm
```

Now you can run:

```bash
asm program.asm
```

from anywhere.

---

# Why?

Just a tiny utility to remove friction when experimenting with Assembly programs.

Assemble → link → run → repeat.

---

Made with <3 by URDev
