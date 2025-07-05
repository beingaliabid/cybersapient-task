# Stage 1: Build
FROM node:22.3.0-slim as builder
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .

# Stage 2: Run
FROM node:22.3.0-slim
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app .
EXPOSE 5000
CMD ["npm", "start"]

