#!/bin/bash

source ./.env
source ./.venv/bin/activate

directory="$(pwd)/pdf_input/beispiele-2024-05-06"

# Collect all files
array=()
for file_name in $directory/*.pdf; do
        if [ -f "$file_name" ]; then
            data=$(echo $file_name | sed -r -e 's/([0-9]+)/ \1/' | sort -k 2 -n | sed -e 's/ //;')
            array+=("$data")
        fi
done

# Collect all files 
for file in "${array[@]}";do
       echo "Convert next file: $file"
       PDF_FILE="${file}"
       JSON_FILE="${file}.json"
       python3 ./code/convert_pdf.py --pdf_file_input ${PDF_FILE} --json_file_output ${JSON_FILE}
done