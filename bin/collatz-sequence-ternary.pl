sub collatz-length(Int $start) { 
    +($start, { $_ %% 2 ?? $_ div 2 !! 3 * $_ + 1 } ... 1);
}

sub MAIN(*@numbers) {
    for @numbers -> $n {
        say "$n: " ~ collatz-length($n.Int);
    }
}


