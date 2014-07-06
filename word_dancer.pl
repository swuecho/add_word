use Dancer2;
use List::MoreUtils qw(uniq);
use DBD::SQLite;
use FindBin qw($Bin);
use lib '/home/builder/add_word/lib';
use Hao::DB::Words;
use Hao::DB::Words::Manager;


get '/' => sub {
    my $dbh = connect_db;  
    my $words = $dbh->selectcol_arrayref('select word from vocabulary');
    template 'show_words.tt',
      {
        'entries'      => [reverse uniq @$words],
        'add_word_url' => uri_for('add'),
      };
};

post '/add' => sub {
    my $word = lc  params->{word}; # TODO: trim
    if ($word =~/\w/) {
      #  $dbh->do('INSERT INTO vocabulary (word) VALUES ("' . $word  . '")');
    }
    redirect '/';
};

dance;
