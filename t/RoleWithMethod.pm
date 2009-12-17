
package RoleWithMethod;

use strict;
use warnings;

use Class::Constraint::DuckType;
Class::Constraint::DuckType->implements(qw/
    foo
    bar
/);

1;

