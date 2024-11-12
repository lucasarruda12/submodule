if [ "$#" -ne 1 ]; then
    echo "usage: $0 filename"
    exit 1
fi

index_dir(){
    dir=$1

    echo "" > "$dir.md"

    for file in "$dir"/*; do
        if [ -f "$file" ]; then
            echo "# [$file](<$file>)" >> "$dir.md"  
        fi

        if [ -d "$file" ]; then
            index_dir "$file"
        fi
    done
}

index_dir "$1"
