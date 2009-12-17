
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin";

use Test::More tests => 3;

sub foo { }
sub bar { }

use_ok('RoleWithMethod');

use_ok('UNIVERSAL::require');
ok('RoleWithMethod'->use, 'require ok');


