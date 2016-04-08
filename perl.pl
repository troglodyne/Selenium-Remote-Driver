use strict;
use warnings;
use Test::More;

package Test::Selenium::Firefox {
    use Moo;
    extends 'Selenium::Firefox', 'Test::Selenium::Remote::Driver';

    1;
};

my $f = Test::Selenium::Firefox->new;

$f->get_ok('about:config');

done_testing;
