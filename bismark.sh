for i in SRR10070129 SRR10070128 SRR10070127 SRR10070126
do
fastq-dump -X 10000 -I --split-files $i
done

cd /gpfs/home/guosa/hpc/methylation/pancrease/WGBS
for i in SRR10070129 SRR10070128 SRR10070127 SRR10070126
do
bismark --bowtie2 --phred33-quals --multicore 1 --fastq -L 32 -N 0 -D 5 -R 1 ~/hpc/db/hg19/bismark -1 $i\_1.fastq -2 $i\_2.fastq -o ./
done

grep 'C methylated in CpG context' *.txt
grep 'C methylated in CHG context' *.txt
grep 'C methylated in CHH context' *.txt
