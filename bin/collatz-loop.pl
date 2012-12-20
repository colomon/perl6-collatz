sub collatz-length(Int $n is copy) {
    my $length = 1;
    while $n != 1 {
        $n = $n %% 2 ?? $n div 2 !! 3 * $n + 1;
        $length++;
    }
    $length;
}

sub MAIN(*@numbers) {
    for @numbers -> $n {
        say "$n: " ~ collatz-length($n.Int);
    }
}


