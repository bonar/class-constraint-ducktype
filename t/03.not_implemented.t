
use strict;
use warnings;

use FindBin;
use Sub::Install;
use lib "$FindBin::Bin";

use Test::More tests => 4;

use_ok('UNIVERSAL::require');
ok(!'RoleWithMethod'->use, 'require failed');

Sub::Install::install_sub({
    code => sub {},
    into => 'main',
    as   => 'foo',
});
ok(!'RoleWithMethod'->use, 'require failed');

Sub::Install::install_sub({
    code => sub {},
    into => 'main',
    as   => 'bar',
});
ok('RoleWithMethod'->use, 'require ok');




