use strict;
use warnings;
use lib 'lib';
use Selenium::Firefox::Profile;
use Selenium::Firefox;


my $p = Selenium::Firefox::Profile->new;
$p->set_preference(
    'permissions.default.image' => 2,
    'browser.migration.version' => 9999
);

my $f = Selenium::Firefox->new(profile => $p,  => 1);
# $f->quit;
