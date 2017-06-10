package Quiz::App;
use Dancer2;
use Dancer2::Plugin::DBIC;

our $VERSION = '0.1';

get '/' => sub {
  use Data::Dumper;
  warn Dumper(resultset('Person'));
    template 'index' => { 'title' => 'Quiz::App' };
};

get '/home' => sub {
    template 'home';
};

get '/home/create-quiz' => sub {
    template 'create-quiz';
};

get '/home/add-student' => sub {
    template 'add-student';
};

true;
