#!/bin/bash

# This program cleans the TXT record from the zone file of the 
# domain being processed, in the ndjbdns server.
#
# Copyright (C) 2023 Rodolfo González González.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

cd /var/lib/ndjbdns/zones/

sed -ri '/^# BEGIN CERTBOT AUTH$/,/^# END CERTBOT AUTH$/d' $CERTBOT_DOMAIN

cd ..
make remote