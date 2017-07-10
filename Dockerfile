FROM python:3

ENV ENV=production

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY src ./src

CMD ["python", "src/index.py"]
