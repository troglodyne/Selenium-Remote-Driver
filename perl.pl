use strict;
use warnings;

use Selenium::Remote::WDKeys 'KEYS';
use Selenium::Remote::Driver;
use Selenium::ActionChains;

my $driver = Selenium::Remote::Driver->new;
$driver->get('https://www.perl.org');
$driver->find_element('body', 'tag_name')->click;

my $action_chains = Selenium::ActionChains->new(driver => $driver);

$action_chains->key_down([KEYS->{'command_meta'}, 'a'])
  ->key_up([KEYS->{'command_meta'}])->perform;
sleep(2); # for visual verification

$action_chains->key_down([KEYS->{'command_meta'}, 't'])
  ->key_up([KEYS->{'command_meta'}])->perform;
sleep(2); # for visual verification

$driver->quit;
