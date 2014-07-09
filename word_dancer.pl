use lib './lib';
use Dancer2;
use List::MoreUtils qw(uniq);
use MH::Schema;
use FindBin qw($Bin);

# settings
my $database  = "$Bin/vocabulary.db";

#set 'template' => 'template_toolkit'; template tookit have more function
# the sad thing is you don know how how many of it

sub get_vocabulary {
    my $schema = MH::Schema->connect("dbi:SQLite:$database");
    my $vocabulary = $schema->resultset('Vocabulary');
    return $vocabulary;
}

my $vocabulary = get_vocabulary;  

get '/' => sub {
    my @words = $vocabulary->get_column('word')->all;
    template 'show_words.tt',
      {
        'entries'      => [reverse uniq @words],
        'add_word_url' => uri_for('add'),
      };
};

post '/add' => sub {
    my $word = lc  params->{word}; # TODO: trim
    if ($word =~/\w/) {
        $vocabulary->create({ word => 'myword'});
    }
    redirect '/';
};

dance;
