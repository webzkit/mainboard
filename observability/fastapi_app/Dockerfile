FROM python:3.12

#RUN pip install uv

WORKDIR /app
COPY ./ ./


RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

CMD ["python", "main.py"]
