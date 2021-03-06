#!/usr/bin/perl -w

use Test::Command tests => 6;

# fping
{
my $cmd = Test::Command->new(cmd => "fping nosuchname.example.com");
$cmd->exit_is_num(2);
$cmd->stdout_is_eq("");
$cmd->stderr_like(qr{^nosuchname\.example\.com: .*not (known|found)});
}

# fping6
{
my $cmd = Test::Command->new(cmd => "fping6 nosuchname.example.com");
$cmd->exit_is_num(2);
$cmd->stdout_is_eq("");
$cmd->stderr_like(qr{^nosuchname\.example\.com: .*not (known|found)});
}
