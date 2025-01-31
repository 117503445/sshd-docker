FROM registry.cn-hangzhou.aliyuncs.com/117503445-mirror/sync:linux.amd64.docker.io.library.alpine.latest AS builder

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

RUN apk add go

WORKDIR /workspace

COPY go.mod go.sum ./
RUN go mod download
COPY main.go ./

ENV CGO_ENABLED=0
RUN go build -o entrypoint .

# FROM alpine
FROM registry.cn-hangzhou.aliyuncs.com/117503445-mirror/sync:linux.amd64.docker.io.library.alpine.latest

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

RUN apk update && apk add --no-cache openssh
RUN ssh-keygen -A
RUN echo "PermitRootLogin=yes" >> /etc/ssh/sshd_config

# ENTRYPOINT [ "/usr/sbin/sshd" ]
# ENTRYPOINT [ "/usr/sbin/sshd", "-D", "-e" ]
COPY --from=builder /workspace/entrypoint /entrypoint

ENTRYPOINT [ "/entrypoint" ]