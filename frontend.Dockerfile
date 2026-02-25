FROM node:20-alpine AS deps
WORKDIR /app
COPY package*.json ./
RUN npm ci

FROM node:20-alpine AS dev
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
# Copy the frontend and config files (Vite project root is the repo root with /src)
COPY . .

EXPOSE 3000
ENV VITE_PORT=3000

# Vite dev server (browser available at http://localhost:3000)
CMD ["sh", "-c", "npm run dev -- --host --port ${VITE_PORT}"]
``
