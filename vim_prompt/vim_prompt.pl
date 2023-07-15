use Irssi;
use strict;

Irssi::settings_add_str('misc','vim_prompt_begin_ins', '%z005f00%k%9 INSERT %w%k');
Irssi::settings_add_str('misc','vim_prompt_begin_cmd', '%z0087d7%k%9 NORMAL %w%k');
Irssi::settings_add_str('misc','vim_prompt_begin_ex', '%zff5f5f%k%9 EX %w%k');
Irssi::settings_add_str('misc','vim_prompt_end_ins', '%N%k%Z005f00%9%N');
Irssi::settings_add_str('misc','vim_prompt_end_cmd', '%N%k%Z0087d7%9%N');
Irssi::settings_add_str('misc','vim_prompt_end_ex', '%N%k%Zff5f5f%9%k%Zff5f5f');

Irssi::expando_create('vim_prompt_begin', sub {
    my $prompt;
    my $cmd_mode = Irssi::parse_special('$vim_cmd_mode', 0, 0);
    if (index($cmd_mode, "INS") != -1) {
        my $prompt_begin = Irssi::settings_get_str('vim_prompt_begin_ins');
        $prompt=$prompt_begin;
    }
    if (index($cmd_mode, "CMD") != -1) {
        my $prompt_begin = Irssi::settings_get_str('vim_prompt_begin_cmd');
        $prompt=$prompt_begin;
    }
    if (index($cmd_mode, "EX") != -1) {
        my $prompt_begin = Irssi::settings_get_str('vim_prompt_begin_ex');
        $prompt=$prompt_begin;
    }
    return $prompt
}, {});

Irssi::expando_create('vim_prompt_end', sub {
    my $prompt;
    my $cmd_mode = Irssi::parse_special('$vim_cmd_mode', 0, 0);
    if (index($cmd_mode, "INS") != -1) {
        my $prompt_begin = Irssi::settings_get_str('vim_prompt_end_ins');
        $prompt=$prompt_begin;
    }
    if (index($cmd_mode, "CMD") != -1) {
        my $prompt_begin = Irssi::settings_get_str('vim_prompt_end_cmd');
        $prompt=$prompt_begin;
    }
    if (index($cmd_mode, "EX") != -1) {
        my $prompt_begin = Irssi::settings_get_str('vim_prompt_end_ex');
        $prompt=$prompt_begin;
    }
    return $prompt
}, {});

Irssi::expando_create('vim_prompt_empty', sub {
    my $prompt;
    my $cmd_mode = Irssi::parse_special('$vim_cmd_mode', 0, 0);
    if (index($cmd_mode, "INS") != -1) {
        $prompt="%z005f00%k%9 INSERT "."%N%k%Z005f00%9%N"
    }
    if (index($cmd_mode, "CMD") != -1) {
        $prompt="%z0087d7%k%9 NORMAL "."%N%k%Z0087d7%9%N"
    }
    if (index($cmd_mode, "EX") != -1) {
        $prompt="%zff5f5f%k%9 EX "."%N%k%Zff5f5f%9%k%Zff5f5f"
    }
    return $prompt
}, {});
