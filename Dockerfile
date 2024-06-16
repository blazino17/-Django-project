# Use the official Python image from the Docker Hub
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Create a directory for the app
WORKDIR /app

# Install PostgreSQL dependencies
RUN apt-get update && apt-get install -y \
    libpq-dev gcc \
    && rm -rf /var/lib/apt/lists/*

# Copy the requirements file
COPY requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Django project code into the container
COPY . /app/

# Expose the port the app runs on
EXPOSE 8000

# Run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]


