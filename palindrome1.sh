echo "Enter the string"
read str
len=${#str}
rev=""
for((i=$len;i>0;i--))
do
temp=`expr $str | cut -c $i`
rev=$rev$temp
done
echo "rev = $rev"
if test $str=$rev
then
echo "String is a palindrome"
else 
echo "String is not a palindrome"
fi
