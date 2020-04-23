#!/bin/sh



#    Copyright (C) 2020  by flaeti

#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.

#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# This script provides
# install docker-compose-host-script-starter and alternativ docker-compose start systemd-service-unit.
#
# You can find more details for each warning at the following page:
#    https://github.com/flaeti1/docker-compose-host-script-starter/


set -e

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi


if test -d /run/systemd/system; then
	echo 'Do you have systemd?' && exit 1
	else wget -O "/etc/systemd/system/docker-compose@.service" \
	       	'https://raw.githubusercontent.com/flaeti1/docker-compose-host-script-starter/master/docker-compose%40.service'
	systemctl daemon-reload	
	wget -O "/usr/local/bin/docker-compose-host-script-starter" \
	       	'https://raw.githubusercontent.com/flaeti1/docker-compose-host-script-starter/master/docker-compose-host-script-starter'
	chmod +x /usr/local/bin/docker-compose-host-script-starter
fi



