my @bam=glob("*.bam");
my @sam=glob("*.sam");
foreach my $sam(@sam){
my ($sample)=split/.sam/,$sam;
if("$sample.bam" ~~ @bam){
next;
}else{
print "sh $sample.sh &\n";
}
}
