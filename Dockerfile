FROM node:16 AS builder
WORKDIR /app
COPY /*.json ./
COPY . .
RUN npm run build

FROM node:16
WORKDIR /app
COPY --from=builder /app ./
EXPOSE ${API_PORT}
CMD ["npm", "run", "start:prod"]
