# Stage 1: Build NGINX with Custom HTML
FROM ubuntu:latest AS build
RUN apt-get update
RUN apt-get install -y unzip
WORKDIR /usr/share/nginx/html
COPY  my-template-website/myweb.zip .
RUN unzip myweb.zip

# Stage 2: Final Image
FROM nginx:alpine
COPY --from=build /usr/share/nginx/html /usr/share/nginx/html

