echo "1. Palindrome with count"
echo "2.Sum of digits of the number"
echo "3. Check if prime"
echo "Enter your choice"
read choice
case $choice in
	1)echo " Enter a string"
	read str
	echo
	#  length using wc command

	len=`echo $str | wc -c`
	len=`expr $len - 1`
	echo " Length of $str=$len "
	i=1
	j=`expr $len / 2`
	while test $i -le $j
	do
	k=`expr $str | cut -c $i`
	l=`expr $str | cut -c $len`
	if test $k != $l
	then
	echo "String is not a palindrome"
	exit 
	fi
	i=`expr $i + 1`
	len=`expr $len - 1 `
	done
	echo " String is a palindrome"
	
	;;

	2)echo "Enter a  number"
	read n
	sum=0
	len=${#n}
	for ((i=1;i<=len;i++))
	do
		temp=`expr $n | cut -c $i`
		sum=`expr $sum + $temp`

	done
	echo $sum
	
	;;
	
	3)echo "Enter a number"
	read num
	i=2
	flag1=1
	flag2=1
	while [ $flag1 -eq 1 -a $flag2 -eq 1 ]
	do
		rem=`expr $num % $i`
		if test $rem -eq 0
		then
		flag1=0
		else
		sqri=`expr $i \* $i`
		if test $sqri -gt $num
		then flag2=0
		else i=`expr $i + 1`
		fi
		fi
	done
	if test $flag1 -eq 1 
		then echo " $num is a prime number "
	else
		echo "$num is not a prime number "
	fi

	;;

	*) echo "Enter a valid choice"
	
	;;

esac

