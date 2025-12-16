# Stage 1: Builder

FROM python:3.9-slim AS builder
WORKDIR /app

# Install build dependencies
COPY app/requirements.txt .
RUN pip install --upgrade pip && pip install --prefix=/install -r requirements.txt

# Stage 2: Runtime

FROM python:3.9-slim
WORKDIR /app

# Copy only installed dependencies from builder stage
COPY --from=builder /install /usr/local

# Copy application code
COPY app/app.py .

# Expose application port
EXPOSE 5000

# Run application
CMD ["python", "app.py"]
