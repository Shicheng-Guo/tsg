cd /gpfs/home/guosa/hpc/methylation/pancrease/WGBS
for i in SRR10070129 SRR10070128 SRR10070127 SRR10070126
do
fastq-dump -I --split-files $i &
done
