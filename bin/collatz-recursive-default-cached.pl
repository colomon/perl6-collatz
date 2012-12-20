multi sub trait_mod:<is>(Routine $r, :$cached!) {
    my %cache;
    #wrap the routine in a block that..
    $r.wrap(-> $arg {
        # looks up the argument in the cache
        %cache.exists($arg)
            ?? %cache{$arg}
            # ... and calls the original, if it
            # is not found in the cache
            !! (%cache{$arg} = callwith($arg))
        }
    );
}

sub collatz-length(Int $n) is cached {
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


