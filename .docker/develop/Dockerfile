FROM rocketchat/base

ENV RC_VERSION develop

MAINTAINER buildmaster@Eduard_Chat

VOLUME /app/uploads

RUN set -x \
 && curl -SLf "https://Eduard_Chat/releases/${RC_VERSION}/download" -o Eduard_Chat.tgz \
 && curl -SLf "https://Eduard_Chat/releases/${RC_VERSION}/asc" -o Eduard_Chat.tgz.asc \
 && gpg --verify Eduard_Chat.tgz.asc \
 && tar -zxf Eduard_Chat.tgz -C /app \
 && rm Eduard_Chat.tgz Eduard_Chat.tgz.asc \
 && cd /app/bundle/programs/server \
 && npm install \
 && npm cache clear

USER rocketchat

WORKDIR /app/bundle

# needs a mongoinstance - defaults to container linking with alias 'mongo'
ENV MONGO_URL=mongodb://mongo:27017/rocketchat \
    HOME=/tmp \
    PORT=3000 \
    ROOT_URL=http://localhost:3000 \
    Accounts_AvatarStorePath=/app/uploads

EXPOSE 3000

CMD ["node", "main.js"]
