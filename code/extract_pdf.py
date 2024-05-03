import argparse
import PyPDF2
import json


'''
{ "pdf_pages" : 
    [{"page":"1","content":"xxx"},
     {"page":"2","content":"yyy"}]]
}
'''
def extract_pages_from_pdf(pdf_path):
    text = ""
    list = []

    with open(pdf_path, "rb") as file:
        pdf_reader = PyPDF2.PdfReader(file)      
        num_pages = len(pdf_reader.pages)

        for page_num in range(num_pages):
            print(f"***** {page_num} / {num_pages} ****")
            page = pdf_reader.pages[page_num]
            text = page.extract_text()
            print(f"*****\n {text} \n****\n")
            value = { "page": page_num, "content": text}
            list.append(value)
        
        pdf_information = { "file": pdf_path, "pages": list}

        return pdf_information
    
def save_pdf_information_in_json(json_file, pdf_dict):
        
        with open(json_file,'w', encoding='utf-8') as json_file:
            json.dump(pdf_dict,json_file)
        
        return


def main(args):
    if args.pdf_file_input is None:
        print(f"PDF file information is missing. '/your/folder/pdf_file.pdf'")
    else:
        input_pdf = args.pdf_file

    if args.json_file_output is None:
        print(f"PDF file information is missing. '/your/folder/pdf_file.pdf'")
    else:
        output_json = args.json_file_output
    
    pdf_information = extract_pages_from_pdf(input_pdf)
    save_pdf_information_in_json( output_json, pdf_information)

    return

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-i", "--pdf_file_input", type=str)
    parser.add_argument("-o", "--json_file_output", type=str)
    args = parser.parse_args()
    main(args)