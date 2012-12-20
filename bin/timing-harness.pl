my @numbers = 1..200, 10000..10200;

sub MAIN(Str $perl6, *@scripts) {
    my %results;
    for @scripts -> $script {
        my $start = now;
        qqx/$perl6 $script { @numbers }/;
        my $end = now;

        %results{$script} = $end - $start;
    }

    for %results.pairs.sort(*.value) -> (:key($script), :value($time)) {
        say "$script: $time seconds";
    }
}