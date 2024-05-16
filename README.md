# Convert pdf to JSON

The extract_PDF project contains a functionality to convert PDF files to JSON files. You use the Python program, bash automation, to convert multiple PDF files.

You define the root folder in the bash file, and the bash automation iterates to all documents and executes the Python program to read the PDF files and convert them into JSON files.

As a result of the conversion process, the PDF files are transformed into JSON files. These JSON files are structured as a JSON array, with each page of the original PDF file represented as an entry in the array.

```json
{ 
  "file": "/path/to/pdf_file/file.pdf",
  "pdf_pages" : 
    [{"page":"1","content":"xxx"},
     {"page":"2","content":"yyy"}]
}
```

* Create folders 

```sh
mkdir pdf_input
mkdir pdf_export
```

* Create a virtual Python environment

```sh
python3 -m venv .venv
source ./.venv/bin/activate
```

* Install need Phython libraries.

```sh
python3 -m pip install PyPDF2
# python3 -m pip install python-docx
```

* Create an `.env` file

```sh
cat env_template >> .env
```

`.env` file content

```sh
export PDF_FILE=
export JSON_FILE=
```

* Extract text from pdf and save it into JSON

```sh
bash show_pdf.sh
```

* Resulting JSON format

```json
{
    "file": "/path/to/pdf_file/file.pdf",
    "pages": [
        {
            "page": 0,
            "content": "CONTENT"
        },
        {
            "page": 1,
            "content": "CONTENT"
        }
    ]
}
```

