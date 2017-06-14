package Quiz::App;
use Dancer2;
use Dancer2::Plugin::DBIC;
use Dancer2::Session::Simple;
use Dancer2::Plugin::Database;
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

    my $user =  resultset('User')->search( username => $username, passwd => $password )->first();

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

post '/add-new-student' => sub {
    my $student_first_name = params->{firstname};
    my $student_last_name  = params->{lastname};
    my $student_username   = params->{username};
    my $student_password   = params->{password};

      resultset('User')->create({
            id => 6,
            first_name => $student_first_name,
            last_name => $student_last_name,
            username => $student_username,
            passwd => $student_password
        });

    redirect '/home/student-add-success'
};

post '/submit-quiz' => sub {

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

get '/home/student-add-success' => sub {
    template 'student-add-success';
};

get '/home/view-students' => sub {
    my @students = resultset('User')->search({is_admin => 0})->all();
    $_ = $_->to_hash foreach (@students);
    my $data = { students => \@students};
    template 'view-students', $data, {};
};

get '/home/view-quizes' => sub {
    my @questions = resultset('Question')->search({})->all();
    $_ = $_->to_hash foreach (@questions);
    my $data = { questions => \@questions};
    template 'view-quizes', $data, {};
};

get '/student/quiz' => sub {
    template 'take-quiz';
};

true;
