use Dancer2;
use Tie::File;
use FindBin qw($Bin);

#set 'template' => 'template_toolkit'; template tookit have more function
# the sad thing is you don know how how many of it

my @words;
# replace absolute address with relative one 

get '/' => sub { 
    tie @words, 'Tie::File', "$Bin/word.txt" 
    or die "can not find file word.txt"; 
        template 'show_words.tt', {
            'entries'     => [ reverse @words ],
            'add_word_url' => uri_for('add'),
        } 
};

post '/add' => sub {
    push @words, params->{word} if params->{word} =~/\w/;
    untie @words;
    redirect '/';
};

dance;
