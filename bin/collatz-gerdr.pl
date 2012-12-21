sub collatz-length(Int $n) {
    state %cache = 1 => 1;
    %cache{$n} //= 1 + collatz-length($n %% 2 ?? $n div 2 !! 3 * $n + 1);
}

sub MAIN(*@numbers) {
    for @numbers -> $n {
        say "$n: " ~ collatz-length($n.Int);
    }
}


