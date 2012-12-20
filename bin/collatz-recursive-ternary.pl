sub collatz-length(Int $n) {
    return 1 if $n == 1;
    1 + ($n %% 2 ?? collatz-length($n div 2) !! collatz-length(3 * $n + 1));
}

sub MAIN(*@numbers) {
    for @numbers -> $n {
        say "$n: " ~ collatz-length($n.Int);
    }
}


