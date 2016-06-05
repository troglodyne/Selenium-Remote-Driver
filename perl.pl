use strict;
use warnings;
use lib 'lib';
use Selenium::Firefox::Profile;
use Selenium::Firefox;
use Parallel::ForkManager;

my $pm = Parallel::ForkManager->new(5);

for (1..1) {
    my $pid = $pm->start and next;

    my $p = Selenium::Firefox::Profile->new;
    my $NEVER_LOAD_IMAGES = '2';
    my $FORCE_RESPECT_DEFAULT_IMAGE = 9999;
    $p->set_preference(
        'permissions.default.image' => $NEVER_LOAD_IMAGES,
        'browser.migration.version' => $FORCE_RESPECT_DEFAULT_IMAGE
    );

    my $f = Selenium::Firefox->new(firefox_profile => $p);
    sleep(99);
    # $f->quit;

    $pm->finish;
}

$pm->wait_all_children;
