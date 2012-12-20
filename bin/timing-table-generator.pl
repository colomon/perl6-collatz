my @numbers = 1..200, 10000..10200;
my $rakudo = "perl6";
my $niecza = "mono ../niecza/run/Niecza.exe";

sub MAIN(*@scripts) {
    my %rakudo-results;
    my %niecza-results;
    for @scripts -> $script {
        my $start = now;
        qqx/$rakudo $script { @numbers }/;
        my $end = now;
        %rakudo-results{$script} = ($end - $start).round(1/10);

        next if $script ~~ /cached/ && $script !~~ /"hand-cached"/;
        
        $start = now;
        qqx/$niecza $script { @numbers }/;
        $end = now;
        %niecza-results{$script} = ($end - $start).round(1/10);
    }

    say '<table border="1" align="center"> <tr><td>Script</td><td>Rakudo</td><td>Niecza</td></tr>';
    for %rakudo-results.pairs.sort(*.value) -> (:key($script), :value($time)) {
        say "<tr>";
        say "    <td> <a href=\"https://github.com/colomon/perl6-collatz/blob/master/$script\"> $script </a> </td>";
        say "    <td> $time </td>";
        say "    <td> { %niecza-results{$script} // "N/A" } </td>";
        say "</tr>";
    }
    say "</table>";
}