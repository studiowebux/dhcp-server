# create the container to host the backend.
FROM centos:latest

WORKDIR /

# Install the prerequisites for the systemctl support
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

# Install the prerequisites for the PXE server
RUN yum update -y
RUN yum install dhcp -y

COPY ./examples/dhcpd.conf /etc/dhcp/dhcpd.conf

RUN systemctl enable dhcpd

VOLUME [ "/sys/fs/cgroup" ]

EXPOSE 67/udp

CMD ["/usr/sbin/init"]