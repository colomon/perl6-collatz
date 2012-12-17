my $perl6 = @*ARGS.shift;
my @numbers = 1..100, 10000..10100;

my %results;
for @*ARGS -> $script {
    my $start = now;
    qqx/$perl6 $script { @numbers }/;
    my $end = now;

    %results{$script} = $end - $start;
}

for %results.pairs.sort(*.value) -> (:key($script), :value($time)) {
    say "$script: $time seconds";
}