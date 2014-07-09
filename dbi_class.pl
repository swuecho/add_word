use lib './lib';
use MH::Schema;

my $schema = MH::Schema->connect('dbi:SQLite:/home/builder/add_word/vocabulary.db');
my $vocabulary = $schema->resultset('Vocabulary');
my @words = $vocabulary->get_column('word')->all;
use DDP;
p $_ for @words;
$vocabulary->create({ word => 'myword'});
my $vocabulary = $schema->resultset('Vocabulary');
my @words = $vocabulary->get_column('word')->all;
use DDP;
p $_ for @words;
