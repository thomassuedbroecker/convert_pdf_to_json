#!/bin/bash

source ./.env
source ./.venv/bin/activate

directory="$(pwd)/docx_input"

# Collect all files
array=()
for file_name in $directory/*.docx; do
        if [ -f "$file_name" ]; then
            data=$(echo $file_name | sed -r -e 's/([0-9]+)/ \1/' | sort -k 2 -n | sed -e 's/ //;')
            array+=("$data")
        fi
done

# Collect all files 
for file in "${array[@]}";do
       echo "Convert next file: $file"
       DOCX_FILE="${file}"
       JSON_FILE="${file}.json"
       python3 ./code/convert_docx.py --docx_file_input ${DOCX_FILE} --json_file_output ${JSON_FILE}
done