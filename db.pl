use lib './lib/';
use Hao::DB;
my $db = Hao::DB->new;
my $dbh = $db->dbh or die $db->error;
my $dt= $db->parse_timestamp('2001-03-05 12:34:56.123');
use DDP;
p $dt;
p $db->driver;
