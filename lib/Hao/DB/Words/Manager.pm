package Hao::DB::Words::Manager;
use lib '/home/builder/add_word/lib';

use base qw(Rose::DB::Object::Manager);

sub object_class { 'Hao::DB::Words' }
 
__PACKAGE__->make_manager_methods('words'); 

1;
