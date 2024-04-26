FROM --platform=linux/amd64 node:20

WORKDIR /app
COPY Dockerfile .devcontainer.json ./
COPY package*.json ./
RUN npm i node-gyp
RUN npm i
COPY . ./

CMD ["npm", "start"]
