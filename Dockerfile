from node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . . 
RUN npm run build

from nginx
copy --from=builder /app/build /usr/share/nginx/html
