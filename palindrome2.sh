echo " Enter a string"
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

