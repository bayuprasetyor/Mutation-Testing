#!/bin/sh

# FOR ORIGINAL
# generating output directory

echo -e ">>> \e[36m ORIGINAL \e[0m"
$(mkdir -p "outputs/ori")
echo -e ">>> \e[92m  output dir for original created. \e[0m"

#generating output
echo ">>> generating output files ..."
for input_file in inputs/*;
do
	echo -e "ori: \e[36m generating $(basename "$input_file") output file..\e[0m"
	source.alt/source.orig/app.exe < $input_file > outputs/ori/$(basename "$input_file")
	echo -e "ori: \e[92m $(basename "$input_file") output created. \e[0m"
done
echo -e ">>> \e[92m ALL DONE FOR ORIGINAL \e[0m" 

# #FOR MUTANT
# #generating output 
echo -e ">>> \e[36m  MUTANTS... \e[0m"
for mutants in {1..7};
do
	in_path="versions.alt/versions.orig/v$mutants"
	out_path="outputs/v$mutants"

	$(mkdir -p "outputs/v$mutants")
	echo -e "v$mutants:  \e[92m v$mutants dir created. \e[0m"

	echo -e "v$mutants: \e[92m generating output files for v$mutants \e[0m"
	for input_file in inputs/*;
	do
		echo -e "v$mutants: \e[36m generating $(basename "$input_file") output file.., \e[0m"
		$in_path/app.exe < $input_file > $out_path/$(basename "$input_file")
		echo -e "v$mutants: \e[92m $(basename "$input_file") output created. \e[0m"	
	done
done
echo -e ">>>> \e[92m ALL DONE FOR MUTANTS \e[0m"

echo -e ">>>> \e[42m JOB COMPLETE <<<< \e[0m" 
sleep 200m
