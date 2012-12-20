sub collatz-length(Int $n) {
    return 1 if $n eq 1;
    1 + ($n %% 2 ?? collatz-length($_ div 2) !! collatz-length(3 * $_ + 1));
}

sub MAIN(*@numbers) {
    for @numbers -> $n {
        say "$n: " ~ collatz-length($n.Int);
    }
}


