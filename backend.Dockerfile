FROM python:3.11-slim AS backend

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl build-essential && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install backend deps
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy backend code and project data folders (created if missing)
COPY backend ./backend
RUN mkdir -p /app/data /app/uploads /app/exports

EXPOSE 8000
ENV HOST=0.0.0.0 PORT=8000

# The repo's FastAPI app entry lives in backend/main.py.
# If the module path differs, change "backend.main:app" accordingly.
CMD ["sh", "-c", "python -m uvicorn backend.main:app --host ${HOST} --port ${PORT}"]
