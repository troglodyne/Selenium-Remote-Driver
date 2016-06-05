use strict;
use warnings;
use lib 'lib';
use Selenium::Firefox::Profile;
use Selenium::Firefox;

# my $p = Selenium::Firefox::Profile->new;
# my $f = Selenium::Firefox->new(firefox_profile => $p);
# $f = Selenium::Firefox->new;

my $f = Selenium::Firefox->new(remote_server_addr => '127.0.0.1');
