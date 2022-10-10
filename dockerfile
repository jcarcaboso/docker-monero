FROM ubuntu

ENV WALLET=4BGFcReKT18j9FFm53RHubA1ERddvnQwxBZk8LD5z5xGVNm5jFXaWmuPEzrbbhpEL5F1yFnTGfngaVUeeosgipoSVj6efjG
ENV POOL=xmrpool.eu:5555
ENV NAME=skorcius

WORKDIR RIG

RUN apt update -y 
RUN apt install wget -y
RUN wget https://github.com/xmrig/xmrig/releases/download/v6.18.0/xmrig-6.18.0-linux-static-x64.tar.gz

RUN tar -xvf xmrig-6.18.0-linux-static-x64.tar.gz
RUN cp -r xmrig-6.18.0/* ./
# WORKDIR xmrig-6.18.0

COPY ./entrypoint.sh .
RUN ls -a
RUN chmod +x ./entrypoint.sh

# ENTRYPOINT ["./entrypoint.sh"]