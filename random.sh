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

echo -e ">>>> \e[42m JOB COMPLETE <<<< \e[0m" 
sleep 200m
