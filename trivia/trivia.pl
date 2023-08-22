use Irssi;
use strict;

our $VERSION = "0.1";
our %IRSSI = (
    authors     => 'terminaldweller',
    contact     => 'https://terminaldweller.com',
    name        => 'trivia',
    description => 'lets you add trivial info for a window as a expando',
    license     => 'GPL3 or newer',
    url         => 'https://github.com/irssi/scripts.irssi.org',
);

my %trivia_list = ();
my $trivia = "";

sub window_changed_handler {
    my $window = Irssi::active_win();
    my $server = Irssi::active_server();
    my $current_window_item_string = $server->{tag}."/".$window->{active}->{name};
    if (exists $trivia_list{$current_window_item_string}) {
        $trivia = $trivia_list{$current_window_item_string};
    } else {
        $trivia = "IRC";
    }
}

Irssi::expando_create('trivia', sub {
  return $trivia;
}, {});

sub setup_changed {
    %trivia_list = map { my @temp = split(',', $_); $temp[0] => $temp[1] } split(' ', Irssi::settings_get_str('trivia_list'));
}

Irssi::settings_add_str('misc','trivia_list','');
Irssi::signal_add('window changed' => 'window_changed_handler');
Irssi::signal_add('setup changed' => 'setup_changed');

%trivia_list = map { my @temp = split(',', $_); $temp[0] => $temp[1] } split(' ', Irssi::settings_get_str('trivia_list'));
Irssi::print(%trivia_list);
