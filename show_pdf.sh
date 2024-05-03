#!/bin/bash

source ./.env
source ./.venv/bin/activate

python3 ./code/extract_pdf.py --pdf_file ${PDF_FILE}