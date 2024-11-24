use lib '.';
use strict;
use warnings;

use inc::Module::Install;

# Definition.
abstract 'Wikibase data type cloning helper.';
author 'Michal Josef Spacek <skim@cpan.org>';
author_requires 'English' => 0;
author_requires 'File::Object' => 0.05;
author_requires 'Test::More' => 0;
author_requires 'Test::NoWarnings' => 0;
author_requires 'Test::Pod' => 0;
author_requires 'Test::Pod::Coverage' => 0;
license 'bsd';
name 'Wikibase-Datatype-Clone';
perl_version 5.006002;
readme_from 'Clone.pm';
recursive_author_tests('xt');
requires 'Class::Utils' => 0.03;
requires 'Class::Inspector' => 0;
requires 'Error::Pure' => 0.15;
requires 'List::Util' => 1.33;
requires 'Readonly' => 0;
requires 'Scalar::Util' => 0;
resources 'bugtracker' => 'https://github.com/michal-josef-spacek/Wikibase-Datatype-Clone/issues',
resources 'homepage' => 'https://github.com/michal-josef-spacek/Wikibase-Datatype-Clone';
resources 'repository' => 'git://github.com/michal-josef-spacek/Wikibase-Datatype-Clone';
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
test_requires 'Test::Shared::Fixture::Wikibase::Datatype::Form::Wikidata::DogCzechSingular' => 0;
test_requires 'Test::Shared::Fixture::Wikibase::Datatype::Item::Wikidata::Dog' => 0;
test_requires 'Test::Shared::Fixture::Wikibase::Datatype::Lexeme::Wikidata::DogCzechNoun' => 0;
test_requires 'Test::Shared::Fixture::Wikibase::Datatype::Mediainfo::Commons::ImageOfHuman' => 0;
test_requires 'Test::Shared::Fixture::Wikibase::Datatype::MediainfoSnak::Commons::Depicts::Human' => 0;
test_requires 'Test::Shared::Fixture::Wikibase::Datatype::MediainfoStatement::Commons::Depicts::Human' => 0;
test_requires 'Test::Shared::Fixture::Wikibase::Datatype::Property::Wikidata::InstanceOf' => 0;
test_requires 'Test::Shared::Fixture::Wikibase::Datatype::Reference::Wikidata::ReferenceURL' => 0;
test_requires 'Test::Shared::Fixture::Wikibase::Datatype::Sense::Wikidata::Dog' => 0;
test_requires 'Test::Shared::Fixture::Wikibase::Datatype::Snak::Wikidata::GivenName::Michal' => 0;
test_requires 'Test::Shared::Fixture::Wikibase::Datatype::Statement::Wikidata::GivenName::Michal' => 0;
test_requires 'Test::Shared::Fixture::Wikibase::Datatype::Value::Item::Wikidata::Dog' => 0;
test_requires 'Unicode::UTF8' => 0;
test_requires 'Wikibase::Datatype::Value::Globecoordinate' => 0;
test_requires 'Wikibase::Datatype::Value::Item' => 0;
test_requires 'Wikibase::Datatype::Value::Lexeme' => 0;
test_requires 'Wikibase::Datatype::Value::Monolingual' => 0;
test_requires 'Wikibase::Datatype::Value::Property' => 0;
test_requires 'Wikibase::Datatype::Value::Quantity' => 0;
test_requires 'Wikibase::Datatype::Value::Sense' => 0;
test_requires 'Wikibase::Datatype::Value::String' => 0;
test_requires 'Wikibase::Datatype::Value::Time' => 0;
tests_recursive;
version '0.01';

# Run.
WriteAll();
