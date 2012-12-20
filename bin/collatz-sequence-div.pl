sub collatz-length(Int $start) { 
    +($start, { when * %% 2 { $_ div 2 }; when * !%% 2 { 3 * $_ + 1 }; } ... 1);
}

sub MAIN(*@numbers) {
    for @numbers -> $n {
        say "$n: " ~ collatz-length($n.Int);
    }
}


