sub collatz-length(Int $n) {
    given $n {
        when 1 { 1 }
        when * %% 2 { collatz-length($_ / 2) }
        default { collatz-length(3 * $_ + 1) }
    } 
}

sub MAIN(*@numbers) {
    for @numbers -> $n {
        say "$n: " ~ collatz-length($n.Int);
    }
}


