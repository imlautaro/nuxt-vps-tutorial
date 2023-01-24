FROM node:18-alpine
WORKDIR /app
RUN npm install -g pm2
COPY . .
RUN npm ci
RUN npm run build
CMD ["pm2-runtime", "ecosystem.config.js"]
EXPOSE 3000
