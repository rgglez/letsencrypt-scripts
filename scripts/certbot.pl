#!/usr/bin/perl

# This program requests a SSL certificate from Let's Script using 
# DNS authentication
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

use Getopt::Long;

my $auth_cmd = '/etc/letsencrypt/auth_ndjbdns.sh';
my $cleanup_cmd = '/etc/letsencrypt/cleanup_ndjbdns.sh';
my $certbot_cmd = 'certbot';

my $domains = '';
my $email = '';

GetOptions ("domains=s" => \$domains,
            "email=s" => \$email)
or die("Error in command line arguments\n");

my @doms = split(/ /, $domains);
my $d = '';

for (@doms) {
  chomp($_);
  $d .= "-d $_ ";
}

my $o = `$certbot_cmd certonly -n --agree-tos --email $email --preferred-challenges dns --manual --manual-public-ip-logging-ok --manual-auth-hook $auth_cmd --manual-cleanup-hook $cleanup_cmd $d`;

print "-------------------------------------------\n";
print $o;
print "-------------------------------------------\n";