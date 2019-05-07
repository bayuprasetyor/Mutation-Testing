RANDOM=$RANDOM
#!/bin/sh

# FOR RANDOM
for i in {1..2492}
do
	random1[$i]=$(( $RANDOM % 10 + 1 ))
	random2[$i]=$(( $RANDOM % 10 + 1 ))
	random3[$i]=$(( $RANDOM % 10 + 1 ))
	echo -e ">>>i = $i nilai random nya ${random1[$i]} ${random2[$i]} ${random3[$i]}"
	echo -e ">>>"
done

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
		source.alt/source.orig/schedule.exe ${random1[$i]} ${random2[$i]} ${random3[$i]} < $input_file > outputs/ori/TS$i/"t"$nama
		echo -e "Original TS$i: \e[92m t$nama output created. \e[0m"
		let nama=nama+1
	done
done
echo -e ">>> \e[92m ALL DONE FOR ORIGINAL \e[0m" 


# FOR MUTANT
# generating output directory
let i=1
let j=1
echo -e ">>> \e[36m MUTANT \e[0m"
echo -e ">>> \e[92m  output dir for mutant created. \e[0m"

#generating output
for j in {1..9}
do
	let nama=1
	for i in {1..5}
	do
		$(mkdir -p "outputs/mutant/v$j/TS$i")
		echo ">>> generating output files ..."
		for input_file in inputs/TS$i/*;
		do
			echo -e "Mutant v$j TS$i: \e[36m generating $(basename "$input_file") output file..\e[0m"
			versions.alt/versions.orig/v$j/schedule.exe ${random1[$i]} ${random2[$i]} ${random3[$i]} < $input_file > outputs/mutant/v$j/TS$i/"t"$nama
			echo -e "Mutant v$j TS$i: \e[92m t$nama output created. \e[0m"
			let nama=nama+1
		done
	done
	echo -e ">>> \e[92m ALL DONE FOR MUTANT V$j \e[0m"
done

echo -e ">>>> \e[42m JOB COMPLETE <<<< \e[0m" 
sleep 200m
