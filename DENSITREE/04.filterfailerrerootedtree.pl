#! /usr/bin/env perl

use strict;

use warnings;



my @root=("pbal01","pbal02","ptri01","ptri02");

@root=sort @root;

my $tag=join " ",@root;



my $tree="/media/uni/data/projects/Populus_phylogenomic/08.all_site_ML_tree/06.densitytree/rooted_tree4/genetree_rooted4.tree";

open I,"< $tree";

open O,"> $0.tre";

while(<I>){

    chomp;

    my @a=split("");

    my $line=$_;

    my $count=0;

    my @part;

    my $num=0;

    for(my $i=1;$i<@a;$i++){

        $part[$num].=$a[$i];

        if($a[$i] eq "("){

            $count++;

        }

        if($a[$i] eq ")"){

            $count--;

        }

        if($count==0 && $a[$i]=~/[,;]/){

            $num++;

        }

    }

    # print join "\n",@part,"\n";

    my $light=0;

    foreach my $part(@part){

        my @member;

        while($part=~/(\w+)/g){

            my $x = $1;

            next unless($x=~/[a-z]/);

            # print "$x\n";

            push @member,$x;

        }

        @member = sort @member;

        my $test = join " ",@member;

        # print "$test\n";

        if($tag eq $test){

            $light=1;

        }

    }

    if($light == 1){

        print O "$line\n";

    }

    # last;

}

close I;

close O;
