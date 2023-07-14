use Irssi;
use strict;

Irssi::expando_create('vim_prompt', sub {
    my $prompt;
    my $cmd_mode = Irssi::parse_special('$vim_cmd_mode', 0, 0);
    my $chatnet = Irssi::parse_special('$chatnet', 0, 0);
    my $T = Irssi::parse_special('$T', 0, 0);
    if (index($cmd_mode, "INS") != -1) {
        $prompt="%z005f00%k%9 INS ".$chatnet."/".$T."%N%k%Z005f00%9%N"
    }
    if (index($cmd_mode, "CMD") != -1) {
        $prompt="%z0087d7%k%9 CMD ".$chatnet."/".$T."%N%k%Z0087d7%9%N"
    }
    if (index($cmd_mode, "EX") != -1) {
        $prompt="%zff5f5f%k%9 EX ".$chatnet."/".$T."%N%k%Zff5f5f%9%k%Zff5f5f"
    }
    return $prompt
}, {});

Irssi::expando_create('vim_prompt_empty', sub {
    my $prompt;
    my $cmd_mode = Irssi::parse_special('$vim_cmd_mode', 0, 0);
    my $chatnet = Irssi::parse_special('$chatnet', 0, 0);
    my $T = Irssi::parse_special('$T', 0, 0);
    if (index($cmd_mode, "INS") != -1) {
        $prompt="%z005f00%k%9 INS "."%N%k%Z005f00%9%N"
    }
    if (index($cmd_mode, "CMD") != -1) {
        $prompt="%z0087d7%k%9 CMD "."%N%k%Z0087d7%9%N"
    }
    if (index($cmd_mode, "EX") != -1) {
        $prompt="%zff5f5f%k%9 EX "."%N%k%Zff5f5f%9%k%Zff5f5f"
    }
    return $prompt
}, {});
