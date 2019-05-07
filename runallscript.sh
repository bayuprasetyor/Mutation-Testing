RANDOM=$RANDOM
#!/bin/sh

# FOR ORIGINAL
# generating output directory
let nama=1
let i=1
echo -e ">>> \e[36m ORIGINAL \e[0m"
echo -e ">>> \e[92m  output dir for original created. \e[0m"

#generating output
for i in {1..5}
do
	$(mkdir -p "outputs/ori/TS$i")
	echo ">>> generating output files ..."
	for input_file in inputs/TS$i/*;
	do
		echo -e "Original TS$i: \e[36m generating $(basename "$input_file") output file..\e[0m"
		source.alt/source.orig/schedule.exe $(( $RANDOM % 10 + 1 )) $(( $RANDOM % 10 + 1 )) $(( $RANDOM % 10 + 1 )) < $input_file > outputs/ori/TS$i/"t"$nama
		echo -e "Original TS$i: \e[92m t$nama output created. \e[0m"
		let nama=nama+1
	done
done
echo -e ">>> \e[92m ALL DONE FOR ORIGINAL \e[0m" 


echo -e ">>>> \e[42m JOB COMPLETE <<<< \e[0m" 
sleep 200m
