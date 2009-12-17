
use inc::Module::Install;

name     'Class-Constraint-DuckType';
license  'perl';
version  '0.01';
abstract_from 'lib/Class/Constraint/DuckType.pm';

requires      'Sub::Install' => '0';
requires      'Carp'         => '0';
test_requires 'Test::More'   => '0';
test_requires 'FindBin'      => '0';
test_requires 'Sub::Install' => '0';
test_requires 'UNIVERSAL::require' => '0';

WriteAll;

