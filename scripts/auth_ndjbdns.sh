#!/bin/bash

# This script generates the TXT record in the zone file for the domain
# being processed, for the ndjbdns server.
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

cat <<EOF >> $CERTBOT_DOMAIN
# BEGIN CERTBOT AUTH
'_acme-challenge.$CERTBOT_DOMAIN:$CERTBOT_VALIDATION:900
# END CERTBOT AUTH
EOF

export -n CERTBOT_VALIDATION

echo $CERTBOT_REMAINING_CHALLENGES
cd ..
make remote
sleep 5