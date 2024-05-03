# extract_pdf

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