FROM node:16-alpine

WORKDIR /usr/src/app

ENV HD_MNEMONIC="stumble, metal, section, trade, dog, clever, violin, food, source, whisper, capable, cave" \
    WITHDRAWAL_ADDRESS=bcrt1qrnjsereta9dqrsctwmqrwrmv0qxf8fsz7zqmxm \
    RPC_CLIENT_URL="http://127.0.0.1" \
    RPC_CLIENT_USER=user \
    RPC_CLIENT_PORT=8333 \
    RPC_CLIENT_PASS=pass \
    RPC_CLIENT_TIMEOUT=30 \
    WALLET_FILENAME=nodefourwallet \
    NETWORK=regtest \
    PORT=4040 \
    HOST=127.0.0.1 \
    LARAVEL_CALLBACK=http://127.0.0.1:8000/hook/listener/btc

RUN mkdir src
COPY package*.json .

RUN npm install
# RUN npm install --only=production

COPY ./src ./src
COPY Dockerfile .

EXPOSE 3000
CMD [ "npm",  "start" ]