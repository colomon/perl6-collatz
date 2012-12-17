my $perl6 = @*ARGS.shift;
my @numbers = 1..100, 10000..10100;

sub collatz-length(Int $n) {
    given $n {
        when 1 { 1 }
        when * %% 2 { 1 + collatz-length($_ div 2) }
        default { 1 + collatz-length(3 * $_ + 1) }
    } 
}

for @*ARGS -> $script {
    my $results = qqx/$perl6 $script { @numbers }/;
    my @mistakes;
    for $results.lines.map({ $_.comb(/\d+/) }) -> $n, $length {
        push @mistakes, $n if collatz-length($n.Int) != $length;
    }
    if @mistakes {
        say "Mistakes in $script: { @mistakes }";
    } else {
        say "$script correct";
    }
}

