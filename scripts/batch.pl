#!/usr/bin/perl

# This program process a file with multiple domains, to request SSL
# certificates using the Let's Encrypt.
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

$file = '';
$certbot = 'sh /etc/letsencrypt/certbot.pl';

GetOptions ("file=s" => \$file)
or die("Error in command line arguments\n");

print "Processing $file\n\n";

if (-r $file) {
   open(F, $file);
   while (<F>) {
      chomp($_);
      print "-------------------------------------------\n";
      print "$_\n\n";
      my $o = `$certbot $_`;
      print "$o\n";
      print "-------------------------------------------\n";
   }
   close(F);
}
else {
   print "Invalid file...\n";
}