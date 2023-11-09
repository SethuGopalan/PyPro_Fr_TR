FROM python:3.8

WORKDIR /app

COPY app.py /app
COPY requirements.txt .
RUN pip install -r requirements.txt

EXPOSE 5001

CMD ["python", "./app.py"]

