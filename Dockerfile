FROM ubuntu:18.04
COPY . /tmp/
RUN apt-get update
RUN apt install -y /tmp/nsgclient18_64.deb
RUN apt install -y --no-install-recommends openssh-server vim

RUN apt-get upgrade -y && \
    apt-get install -y  network-manager net-tools firefox apt-utils xdg-utils libwebkitgtk-1.0-0 libxmu6 libxpm4 dbus-x11 xauth libcurl3 openssh-server wget && \
    mkdir /var/run/sshd && \
    echo "PermitEmptyPasswords yes" >> /etc/ssh/sshd_config && \
    echo "AddressFamily inet" >> /etc/ssh/sshd_config && \
    sed -i '1iauth sufficient pam_permit.so' /etc/pam.d/sshd 

RUN useradd -ms /bin/bash test

ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
CMD ["/usr/sbin/sshd", "-D"]