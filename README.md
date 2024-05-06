# extract_pdf

The `extract_PDF` project contains a functionality to convert PDF files to JSON files.
You use the Python program a bash automation to convert multiple PDF files.

You define the root folder in the bash file, and the bash automation iterates to all documents and executes the Python program to read the PDF files and convert them into JSON files.

The conversion of PDF files and generates JSON files in the following format. A JSON array with entries for each page.

```json
{ "pdf_pages" : 
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
```

* Create an `.env` file

```sh
cat env_template >> .env
```

* Extract text from pdf and save it into JSON

```sh
bash show_pdf.sh
```

