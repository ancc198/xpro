FROM alpine
RUN apk add --no-cache --virtual .build-deps ca-certificates curl unzip
ADD configure.sh /configure.sh
RUN chmod +x /configure.sh
CMD /configure.sh


#FROM golang:alpine AS builder
#RUN apk update && apk add --no-cache git bash curl
#WORKDIR /go/src/v2ray.com/core
#RUN git clone --progress https://github.com/v2fly/v2ray-core.git . && \
#    bash ./release/user-package.sh nosource noconf codename=$(git describe --tags) buildname=flysky abpathtgz=/tmp/v2ray.tgz

#FROM alpine
#ENV CONFIG=https://raw.githubusercontent.com/ancc198/xpro/master/config.json
#COPY --from=builder /tmp/v2ray.tgz /tmp
#RUN apk update && apk add --no-cache tor ca-certificates && \
#    tar xvfz /tmp/v2ray.tgz -C /usr/bin && \
#    rm -rf /tmp/v2ray.tgz
    
#RUN rm -rf /go    
    
#CMD nohup tor & \
#    v2ray -config $CONFIG
