# docker-compose-host-script-starter
docker-compose extension for starting scripts on the host system with systemd service unit and support script

run install.sh

or manual
Place the script docker-compose-host-script-starter in /usr/local/bin/
Place the docker-compose@.service in /etc/systemd/system/
run
```shell
sudo systemctl systemctl daemon-reload
```
In the docker container working directory e.g. /opt/dockerfiles/<projectname> the following files can be created now.
 - ./docker-compose.predown
 - ./docker-compose.postdown
 - ./docker-compose.postup
 - ./docker-compose.preup

**Note: If the file exists, it runs with sh .**

**Hint: Disable dockers iptables activity for use iptables on host manual.**
 - In docker service unit: ExecStart=/usr/bin/docker daemon -H fd:// <a href="https://linuxconfig.org/how-to-disable-docker-s-iptables-on-systemd-linux-systems" target="_blank">--iptables=false</a>
 - <a href="https://linuxconfig.org/how-to-disable-docker-s-iptables-on-systemd-linux-systems" target="_blank">https://linuxconfig.org/how-to-disable-docker-s-iptables-on-systemd-linux-systems</a>
