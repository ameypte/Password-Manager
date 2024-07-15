FROM ubuntu


COPY password_manager/package.json package.json
RUN npm install 

RUN apt-get update
RUN apt-get -y install curl 
RUN curl -sL https://deb.nodesource.com/setup_18.x  | bash -
RUN apt-get -y install nodejs

RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY server/requirements.txt requirements.txt
RUN apt-get update && apt-get install -y python3-venv
RUN python3 -m venv venv
RUN . venv/bin/activate && pip install -r requirements.txt

COPY password_manager/public public
COPY password_manager/src src
COPY password_manager/package-lock.json package-lock.json
COPY server/server.py server.py

CMD ["npm", "start"]