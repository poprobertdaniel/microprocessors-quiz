package Quiz::App;
use Dancer2;

our $VERSION = '0.1';

get '/' => sub {
    template 'index' => { 'title' => 'Quiz::App' };
};

get '/home' => sub {
    template 'home';
};

get '/home/create-quiz' => sub {
    template 'create-quiz';
};
true;
