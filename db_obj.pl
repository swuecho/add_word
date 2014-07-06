use v5.12;
use DDP;
use lib '/home/builder/add_word/lib';
use Hao::DB::Words;
use Hao::DB::Words::Manager;
my $words = Hao::DB::Words::Manager->get_words;
p $words;
my $p = Hao::DB::Words->new(id => 3);
$p->load();
p $p;
say $p->word;
say $p->id;
say $p->timestamp;
__END__
problem to deal with the time 
id                                       1,
            timestamp                                undef,
            word                                     "Cane",
