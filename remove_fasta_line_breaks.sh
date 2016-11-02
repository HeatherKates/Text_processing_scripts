#!/usr/bin/perl

#removes line breaks in fasta files so that the header and sequence are on a single line

@FILES=*fa;
foreach $f (@FILES)
{

open FH, "<$f";
open OUT, ">$f_one_line_per_seq.fasta";


        while (<FH>)
        {
                if (/^(\>\S+)/)
                {
                        print OUT "\n$1\t";
                }
                elsif (/^(\w+)\n/)
                {
                        print OUT "$1";
                }

        }


close FH;
}

