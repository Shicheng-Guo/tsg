use Cwd;
my $FF1="/thinker/aid/udata/bing/beijingYixian/fastqs/Methy";
my $FF2="/thinker/storage/udata/muyl/genomes/human/ucsc.hg19.nb/bowtie2Index";
my $FF3="/thinker/storage/udata/muyl/genomes/human/ucsc.hg19.nb/ucsc.hg19.fasta";
open F,"saminfo.txt";
while(<F>){
chomp;
my ($file1,$file2)=split/\s+/;
my ($sam)=split/_R1/,$file1;
open F2,">$sam.sh";
print F2 "bowtie2 -q -x $FF2/hg19 -1 $FF1/$file1 -2 $FF1/$file2 -S $sam.sam\n";
print F2 "samtools view -bS $sam.sam > $sam.bam\n";
print F2 "samtools sort $sam.bam -o $sam.sorted.bam \n";
print F2 "samtools mpileup -uf $FF3 $sam.sorted.bam -v -o $sam.vcf\n";
}
