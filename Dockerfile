FROM python:3.11

WORKDIR /app

COPY requirements.txt /app/
RUN apt-get update
RUN apt-get install -y build-essential
RUN pip install --upgrade pip
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

COPY . /app/

EXPOSE 8501

CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
