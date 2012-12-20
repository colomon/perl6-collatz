sub collatz-length(Int $n) {
    given $n {
        when 1      { 1 }
        when * %% 2 { 1 + collatz-length($_ div 2) }
        default     { 1 + collatz-length(3 * $_ + 1) }
    } 
}

sub MAIN(*@numbers) {
    for @numbers -> $n {
        say "$n: " ~ collatz-length($n.Int);
    }
}


