# use an existing docker image as a base
FROM node:alpine as builder
WORKDIR /app
COPY ./package.json ./
# Download and install a dependency
RUN npm install
# Tell the image what to do when it starts
# as a container
COPY ./ ./
RUN npm run build


FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html