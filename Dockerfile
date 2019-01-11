FROM node:8 as react-build
RUN apt-get update \
   && apt-get install -y inotify-tools \
   && apt-get clean \
   && rm -rf /var/lib/apt/lists/ */tmp/* /var/tmp/*
COPY . ./
ENV PORT 3000
RUN yarn
RUN yarn build
ENV APP_NAME my-app
CMD [ "yarn", "start" ]

