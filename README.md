# Webuxlab - DHCP Server

This project create a DHCP Server for Legacy machine in a docker container using IPv4.

## Getting Started

This documentation will provide you a working DHCP server and an example to integrate it with a PXE server.

### Prerequisites

- Docker
- Centos or Ubuntu is recommended
- An external PXE server

```
yum install docker-ce -y
```

### Installing

to build the image,
update the dhcpd.conf file located in the example folder,then proceed.

```
docker build . -t dhcp-server:latest
```

you should get an image named dhcp-server:latest

You can start the image with this command:
```
docker run -it --name dhcp \
-p 67:67/udp \
-p 67:67 \
-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
-v /tmp/$(mktemp -d):/run \
--privileged \
--net host \
dhcp-server:latest
```

## Folder structure
### dhcpd.conf
this file contains the dhcpd configuration

### Others
/sys/fs/cgroup & /run are defined because systemctl is required and these folders are required.

## Usage Example

``` 
nano dhcpd.conf 
```
to change your dhcp configuration.

## Running the tests

Create a VM or use a physical machine, boot the machine and do a dhcp request

## Contributing

If you have improvements or ideas, you can create pull request.

## Authors

* **Studio Webux S.E.N.C** - *SW* - [studiowebux](https://studiowebux.com)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details