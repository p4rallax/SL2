echo "Enter size of array"
read n
echo " Enter array elements"
for (( i=0 ; i<n ; i++ ))
	do
	echo " Enter a[$i]"
	read a[$i] 
	done

for (( k=0 ; $k -lt $[`expr n - 1`] ; k++))
do
for (( j=0 ; $j -lt $[`expr n - 1`] ; j++))
	do
	temp=0
	if test $[a[$j]] -gt $[a[`expr $j + 1`]]
	then temp=$a[[$j]]
	a[$j]=$[a[`expr $j + 1`]]
	a[`expr $j + 1`]=$temp 
	fi
	done
done
echo "Sorted array :"
for (( i=0 ; i<n ; i++))
	do
	echo $[a[$i]]
	done
