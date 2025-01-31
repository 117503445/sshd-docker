
# FROM alpine
FROM registry.cn-hangzhou.aliyuncs.com/117503445-mirror/sync:linux.amd64.docker.io.library.alpine.latest

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

RUN apk update && apk add --no-cache openssh
RUN ssh-keygen -A

# ENTRYPOINT [ "/usr/sbin/sshd" ]
ENTRYPOINT [ "/usr/sbin/sshd", "-D", "-e" ]