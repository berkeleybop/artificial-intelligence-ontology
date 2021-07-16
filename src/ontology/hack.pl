#!/usr/bin/perl
while(<>) {
    if (m@^(Name|LABEL)@) {
        print;
        next;
    }
    chomp;
    @vals = split(/\t/, $_);
    $vals[1] = "DLO:$vals[1]";
    $vals[8] = join("|", (map { "DLO:$_" } split(/|/, $vals[8]));
    print join("\t", @vals)."\n";
}
