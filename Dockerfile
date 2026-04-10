FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Create necessary directories
RUN mkdir -p staticfiles media

EXPOSE 8001

# Create entrypoint script
RUN echo '#!/bin/bash\nset -e\necho "Running migrations..."\npython manage.py migrate\necho "Starting gunicorn..."\ngunicorn doccheck_service.wsgi:application --bind 0.0.0.0:8001 --workers 3 --timeout 120' > /app/entrypoint.sh && chmod +x /app/entrypoint.sh

# Run entrypoint
CMD ["/app/entrypoint.sh"]
