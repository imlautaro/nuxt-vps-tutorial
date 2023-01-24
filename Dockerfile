FROM node:18-alpine
WORKDIR /app
RUN npm install -g pm2
RUN npm install -g pnpm
COPY . .
RUN pnpm install --prod
RUN pnpm build
CMD ["pm2-runtime", "ecosystem.config.js"]
EXPOSE 3000
