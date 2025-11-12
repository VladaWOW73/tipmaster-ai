FROM python:3.10-slim

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PATH="/root/.local/bin:${PATH}"

WORKDIR /app

# Copy dependency file first (better caching)
COPY requirements.txt .

# Install dependencies safely
RUN pip install --upgrade pip
RUN pip install --no-cache-dir agency-swarm[fastapi]>=1.2.1
RUN if [ -f requirements.txt ]; then pip install --no-cache-dir -r requirements.txt; fi

# Copy source code
COPY . .

# Expose FastAPI port
EXPOSE 8080

# Run the agent
CMD ["python3", "-u", "main.py"]
