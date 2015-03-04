package Selenium::PhantomJS;
$Selenium::PhantomJS::VERSION = '0.24';
# ABSTRACT: A convenience package for creating a PhantomJS instance
use Moo;
extends 'Selenium::Remote::Driver';


has '+browser_name' => (
    is => 'ro',
    default => sub { 'phantomjs' }
);

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Selenium::PhantomJS - A convenience package for creating a PhantomJS instance

=head1 VERSION

version 0.24

=head1 SYNOPSIS

    my $driver = Selenium::PhantomJS->new;

=head1 SEE ALSO

Please see those modules/websites for more information related to this module.

=over 4

=item *

L<Selenium::Remote::Driver|Selenium::Remote::Driver>

=back

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website
https://github.com/gempesaw/Selenium-Remote-Driver/issues

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHORS

=over 4

=item *

Aditya Ivaturi <ivaturi@gmail.com>

=item *

Daniel Gempesaw <gempesaw@gmail.com>

=item *

Luke Closs <cpan@5thplane.com>

=item *

Mark Stosberg <mark@stosberg.com>

=back

=head1 COPYRIGHT AND LICENSE

Copyright (c) 2010-2011 Aditya Ivaturi, Gordon Child

Copyright (c) 2014 Daniel Gempesaw

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=cut
