# sshd-docker

A Docker encapsulation of the sshd (OpenSSH Daemon) service, suitable for testing scenarios and providing SFTP services, among others.

## Quick Start

To start the service, use the following command:

```sh
docker run --env PASSWORD=123456 --rm -p 23:22 117503445/sshd
```

To connect to the service, use:

```sh
ssh -p 23 root@localhost
```

Alternatively, you can map your public key to `/root/.ssh/authorized_keys` inside the container, allowing login with a private key directly.

## Configuration Reference

The login password can be set via the `PASSWORD` environment variable. By default, it is empty, which means password login is disabled unless specified.