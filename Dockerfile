FROM node:18-alpine
WORKDIR /app
RUN npm install -g pm2
RUN curl -f https://get.pnpm.io/v6.16.js | node - add --global pnpm
COPY pnpm-lock.yaml .
RUN pnpm fetch --prod
COPY . .
RUN pnpm install -r --offline --prod
RUN pnpm build
CMD ["pm2-runtime", "ecosystem.config.js"]
EXPOSE 3000
