FROM node:12 AS BUILDER

RUN mkdir -p /app
WORKDIR /app
COPY . /app
RUN npm install && npm run build

# --- ---------------------------------------- ---

FROM nginx:latest

COPY --from=BUILDER /app/site /usr/share/nginx/html
