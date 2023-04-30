# letsencrypt-scripts

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
![GitHub all releases](https://img.shields.io/github/downloads/rgglez/letsencrypt-scripts/total) 
![GitHub issues](https://img.shields.io/github/issues/rgglez/letsencrypt-scripts) 
![GitHub commit activity](https://img.shields.io/github/commit-activity/y/rgglez/letsencrypt-scripts)

Some helper scripts for Let's Encrypt administration. These scripts use DNS authentication for the requests. 
It works with the [ndjbdns](https://github.com/pjps/ndjbdns) server, assuming that each domain has an independent 
zone file (see [my scripts](https://github.com/rgglez/ndjbdns-scripts) for working with this configuration).

These scripts must be placed in the same machine as the ndjbdns server.

## Scripts

* **auth_ndjbdns.sh** - Generates the TXT record for the authentication, in the DNS zone file. This assumes that there're one zone file per domain.
* **cleanup_ndjbdns.sh** - Removes the TXT record from the DNS zone file, after request is completed.
* **certbot.pl** - Executes the certbot request. It takes 2 parameters:
  * --domains a string listing the domains, for instance: "example.com *.example.com"
  * --email your e-mail address.
* **batch.pl** - Batch processing for several domains. It takes one parameter:
  * --file the path of a file listing, one per line, the domains to be processed.

## Dependencies

* [Getopt::Long](https://perldoc.perl.org/Getopt::Long)
* [ndjbdns-scripts](https://github.com/rgglez/ndjbdns-scripts)

## Notes

* You must adjust the paths as you need.

## License

Copyright (c) 2020, Rodolfo González González.

Read the LICENSE file.
