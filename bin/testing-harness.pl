my @numbers = 1..100, 10000..10100;

sub collatz-length(Int $n) {
    given $n {
        when 1 { 1 }
        when * %% 2 { 1 + collatz-length($_ div 2) }
        default { 1 + collatz-length(3 * $_ + 1) }
    } 
}

sub MAIN(Str $perl6, *@scripts) {
    for @scripts -> $script {
        my $results = qqx/$perl6 $script { @numbers }/;
        my @results = $results.lines.map({ $_.comb(/\d+/) }).map(* => *);

        say "Hey, $script doesn't seem to have done the assigned work" 
            unless @numbers (<=) @results && @results (<=) @numbers;

        my @mistakes;
        for @results -> (:key($n), :value($length)) {
            push @mistakes, $n if collatz-length($n.Int) != $length;
        }
        if @mistakes {
            say "Mistakes in $script: { @mistakes }";
        } else {
            say "$script correct";
        }
    }
}

