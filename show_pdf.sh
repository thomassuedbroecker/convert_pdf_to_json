#!/bin/bash

source ./.env
source ./.venv/bin/activate

python3 ./code/extract_pdf.py --pdf_file_input ${PDF_FILE} --json_file_output ${JSON_FILE}