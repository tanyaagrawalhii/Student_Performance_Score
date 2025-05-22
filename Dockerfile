# Use lightweight Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install OS packages
RUN apt-get update && apt-get install -y build-essential && rm -rf /var/lib/apt/lists/*

# Copy all files
COPY . .

# Install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose port for Flask
EXPOSE 5000

# Run app using Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
