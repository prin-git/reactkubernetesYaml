FROM node AS build
WORKDIR /podman-react-vite
COPY package.json .
RUN npm i
COPY . .
RUN npm run build

FROM nginx
COPY  --from=build ../podman-react-vite/dist /usr/share/nginx/html