import re
from pdfminer.high_level import extract_text

def extract_text_from_pdf(pdf_path):
    return extract_text(pdf_path)

def extract_skills_from_resume(text, skills_list):
    skills = []

    for skill in skills_list:
        pattern = r"\b{}\b".format(re.escape(skill))
        match = re.search(pattern, text, re.IGNORECASE)
        if match:
            skills.append(skill)

    return skills

def predict():
    pdf_path = 'media/input/CV1.pdf'
    text = extract_text_from_pdf(pdf_path)

    # List of predefined skills
    skills_list = ['Python','SQL','PHP','HTML','Power BI']
    extracted_skills = extract_skills_from_resume(text, skills_list)
    formatted_skills = ', '.join(extracted_skills)
    return formatted_skills
 

