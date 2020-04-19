FROM node:10

RUN mkdir -p /usr/src/app/express-server/

WORKDIR /usr/src/app/express-server/

COPY express-server ./

RUN npm install

RUN rm -rf dist/*

COPY AppWeb/ dist/

EXPOSE 3000

#CMD ["npm", "run", "start"]

ENTRYPOINT ["node", "app.js"]
