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
