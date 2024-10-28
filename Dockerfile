FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

EXPOSE 8000

RUN python3 manage.py makemigrations
RUN python3 manage.py migrate

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]