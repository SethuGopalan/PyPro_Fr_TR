FROM python:3.8

WORKDIR /app

COPY E:\PyPro_Fr_Tr\myenv /app
COPY requirements.txt .
RUN pip install -r requirements.txt

EXPOSE 5001

CMD python ./myenv\app.py

