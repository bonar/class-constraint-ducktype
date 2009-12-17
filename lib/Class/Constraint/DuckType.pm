
package Class::Constraint::DuckType;

use strict;
use warnings;

use Carp qw/croak/;
use Sub::Install;

our $VERSION = '0.01';

sub implements {
    my ($class, @method) = @_;
    ducktype((caller)[0], @method);
}

sub ducktype {
    my ($dest_pkg, @method) = @_;
    Sub::Install::install_sub({
        code => sub {
            my ($pkg, @arg) = @_;
            my $check_pkg = (caller)[0];
            foreach my $method (@method) {
                next if $check_pkg->can($method);
                croak "package [$check_pkg] "
                    . "does not implement [$method]";
            }
        },
        into => $dest_pkg,
        as   => 'import',
    });
}

1;

__END__

=head1 NAME

Class::Constraint::DuckType - specify subs that classes must implement

=head1 SYNOPSIS

  package Constraint::Cipher;
  use Class::Constraint::DuckType;
  Class::Constraint::DuckType->implements(qw/
      encrypt
      decrypt
  /);
  1;
  
  package Cipher::Caesar;
  use Constraint::Cipher;
  sub encrypt { }
  1;
  
  package main;
  use Cipher::Caesar; # croak! decrypt not implemented

=head1 DESCRIPTION

This module allows you to create simple constraint class.
You can force the class to implement a specific method.
first of all, create a constraint class:

  package Constraint::Serializable;
  use Class::Constraint::DuckType;
  Class::Constraint::DuckType->implements(qw/
      serialize
  /);

All the modules that use Constraint::Serializable must
implement serialize() method. following package is ok:

  package Foo;
  use Constraint::Serializable;
  sub serialize { }

following package croaks when used:

  package Bar;
  use Constraint::Serializable;
  sub bar { }

so you can use this constraint like this:

  if ($object->isa('Constraint::Serializable')) {
      print $object->serialize();
  }

=head1 METHOD

=over

=item implements(@method)

add @method to caller constraint list.

=back

=head1 AUTHOR

Nakano Kyohei (bonar) <bonar@cpan.com>

=cut

