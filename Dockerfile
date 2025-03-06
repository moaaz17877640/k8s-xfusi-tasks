FROM python:3.7-slim
WORKDIR /app
COPY . .    
RUN pip install --trusted-host pypi.python.org -r requirements.txt
CMD ["python", "file.py"]