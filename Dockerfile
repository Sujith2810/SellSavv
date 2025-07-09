FROM python:3.11

WORKDIR /app

# Install build tools
RUN apt-get update && apt-get install -y build-essential

# Copy requirements
COPY requirements.txt .

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt || (echo "💥 Pip install failed. Contents of requirements.txt:" && cat requirements.txt)

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the rest of your application
COPY . .

EXPOSE 8501

CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
