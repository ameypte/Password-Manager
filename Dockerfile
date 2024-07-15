FROM ubuntu

RUN apt-get update
RUN apt-get -y install curl 
RUN curl -sL https://deb.nodesource.com/setup_18.x  | bash -
RUN apt-get -y install nodejs


COPY password_manager/public public
COPY password_manager/src src
COPY password_manager/package.json package.json
COPY password_manager/package-lock.json package-lock.json

RUN npm install

ENTRYPOINT ["npm", "start"]



