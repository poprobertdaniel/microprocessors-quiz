package Quiz::App;
use Dancer2;
use Dancer2::Plugin::DBIC;
use Dancer2::Session::Simple;
use Data::Dumper;

our $VERSION = '0.1';

get '/' => sub {
    my $session = session();
    if ( $session->read('user') ) {
        if ( $session->read('user')->id == 1 ) {
            redirect '/home'
        }
        else {
            redirect '/student'
        }
        return;
    }
    template 'index' => { 'title' => 'Quiz::App' };
};

post '/login' => sub {
    my $username = params->{username};
    my $password = params->{password};
warn $username;

    my $user =  resultset('User')->search( username => $username, passwd => $password )->first();

warn Dumper $user;

    if ( !$user ) {
        redirect '/';
        return;
    }

    my $session = session();
    $session->write( 'user', $user );

    if ( $user->id == 1 ) {
        redirect '/home'
    }
    else {
        redirect '/student'
    }
};

get '/home' => sub {
    my $session = session();
    if ( !$session->read('user') ) {
        redirect '/';
        return;
    }
    template 'home';
};

get '/student' => sub {
    my $session = session();
    if ( !$session->read('user') ) {
        redirect '/';
        return;
    }
    template 'student';
};

get '/logout' => sub {
    my $session = session();
    $session->delete('user');
    redirect '/';
};

get '/home/create-quiz' => sub {
    template 'create-quiz';
};

get '/home/add-student' => sub {
    template 'add-student';
};

true;
