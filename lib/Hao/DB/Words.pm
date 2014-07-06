package Hao::DB::Words;
use lib '/home/builder/add_word/lib';
use Hao::DB;
use base qw(Rose::DB::Object);

__PACKAGE__->meta->table('words');
__PACKAGE__->meta->auto_initialize;
 
sub init_db { Hao::DB->new }

1;
