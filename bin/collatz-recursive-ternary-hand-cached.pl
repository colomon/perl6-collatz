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


