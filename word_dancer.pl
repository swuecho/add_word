use Dancer2;
use List::MoreUtils qw(uniq);
use DBD::SQLite;
use FindBin qw($Bin);

# settings
set 'database'   => "$Bin/vocabulary.db";

#set 'template' => 'template_toolkit'; template tookit have more function
# the sad thing is you don know how how many of it

sub connect_db {
  my $dbh = DBI->connect("dbi:SQLite:dbname=".setting('database')) or
  die $DBI::errstr;
  return $dbh;
}


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
        my $db = connect_db();
        my $sql = 'insert into vocabulary (word) values (?)';
        my $sth = $db->prepare($sql) or die $db->errstr;
        $sth->execute($word) or die $sth->errstr;
    }
    redirect '/';
};

dance;
