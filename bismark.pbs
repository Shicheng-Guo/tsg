mkdir temp
for i in SRR10070129 SRR10070128 SRR10070127 SRR10070126
do
echo \#PBS -N $i  > $i.job
echo \#PBS -l nodes=1:ppn=1 >> $i.job
echo \#PBS -M Guo.shicheng\@marshfieldresearch.org >> $i.job
echo \#PBS -m abe  >> $i.job
echo \#PBS -o $(pwd)/temp/ >>$i.job
echo \#PBS -e $(pwd)/temp/ >>$i.job
echo cd $(pwd) >> $i.job
echo fastq-dump -I --split-files $i >> $i.job
echo bismark --bowtie2 --phred33-quals --multicore 1 --fastq -L 32 -N 0 -D 5 -R 1 ~/hpc/db/hg19/bismark -1 $i\_1.fastq -2 $i\_2.fastq -o ./  >>$i.job
qsub $i.job
done
