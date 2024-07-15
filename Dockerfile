FROM ubuntu

RUN apt-get update
RUN apt-get -y install curl 
RUN curl -sL https://deb.nodesource.com/setup_18.x  | bash -
RUN apt-get -y install nodejs

RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY password_manager/package.json package.json
RUN npm install 

COPY password_manager/public public
COPY password_manager/src src
COPY password_manager/package-lock.json package-lock.json
COPY server/server.py server.py

CMD ["npm", "start"]