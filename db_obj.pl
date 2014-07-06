use lib '/home/builder/add_word/lib';
use Hao::DB::Words;
use Hao::DB::Words::Manager;
my $p = Hao::DB::Words->new(word => 'plane');
print $p->word; # 1.99
$p->save;
my $words =  Hao::DB::Words::Manager->get_words;
p $words;
