sub collatz-length(Int $n) {
    return 1 if $n == 1;
    state %lengths;
    return %lengths{$n} if %lengths.exists($n);
    %lengths{$n} = 1 + ($n %% 2 ?? collatz-length($n div 2) !! collatz-length(3 * $n + 1));
}

sub MAIN(*@numbers) {
    for @numbers -> $n {
        say "$n: " ~ collatz-length($n.Int);
    }
}


