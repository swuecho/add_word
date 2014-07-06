package Hao::DB;
 
use Rose::DB;
our @ISA = qw(Rose::DB);

__PACKAGE__->use_private_registry; 
# Register your lone data source using the default type and domain
__PACKAGE__->register_db(
  domain   => 'development', 
  type     => 'main', 
  driver   => 'sqlite',
  database => '/home/builder/add_word/db/words.db',
);

__PACKAGE__->default_domain('development');
__PACKAGE__->default_type('main');


# Set max length of varchar columns used to emulate the array data type
#Rose::DB::SQLite->max_array_characters(128);
# why is this not work?

# gotchas
# have to set default_domain and default type
1;

