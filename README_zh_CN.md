# sshd-docker

sshd (OpenSSH Daemon) 服务的 Docker 封装，适用于测试及提供 SFTP 服务等场景。

## 快速开始

启动服务

```sh
docker run --env PASSWORD=123456 --rm -p 23:22 117503445/sshd
```

连接

```sh
ssh -p 23 root@localhost
```

也可以将公钥映射到容器的 `/root/.ssh/authorized_keys`，然后就可以直接使用私钥登录了。

## 配置参考

可以通过环境变量 `PASSWORD` 来设置登录密码。默认为空，此时无法使用密码登录。
