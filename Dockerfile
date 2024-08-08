FROM --platform=linux/amd64 debian:bookworm-slim

RUN apt-get update && apt-get install unzip openssl ca-certificates -y
COPY ./jupiter-swap-api-x86_64-unknown-linux-gnu.zip ./jupiter-swap-api-x86_64-unknown-linux-gnu.zip
RUN unzip jupiter-swap-api-x86_64-unknown-linux-gnu.zip
RUN rm jupiter-swap-api-x86_64-unknown-linux-gnu.zip
RUN chmod +x jupiter-swap-api

ENV RUST_LOG=info

CMD ["./jupiter-swap-api --rpc-url https://mainnet.helius-rpc.com/?api-key=e2aaf324-f61f-44af-8bf9-d3beab7a03a0"]