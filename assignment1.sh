#Assignment 1 
#Student database


while true
do
	echo "1.Create database"
	echo "2.Insert data"
	echo "3.Search"
	echo "4.View"
	echo "5.Delete"
	echo "6.Modify"
	echo "7.Exit"
	echo "Enter your choice"
	
read ch
if test $ch -eq 7
	then exit
fi

case $ch in
	1)	
		echo "RNo   Name      M1   M2   M3  " > student	
		
		;;
		
	2)
		clear
		x=1
		while [ $x -eq 1 ]
		do
			echo "Enter roll number"
			read roll
			if grep -i "$roll" student 
				then echo "Roll number already exists."
			else x=0
			fi
		done
			echo "Enter name"
			read name
			echo "Enter marks in subject 1"
			read m1
			echo "Enter marks in subject 2"
			read m2
			echo "Enter marks in subject 3"
			read m3
		
		
		echo "$roll   $name   $m1   $m2   $m3" >> student
		sort -o student -k 1 student 
		echo "Record inserted."
		
		;;
		
	3)
		echo "Enter roll number to be searched"
		read roll
		if grep -i "$roll" student
		then echo "Record found"
		else echo "Record not found"
		fi
		
		;;
		
	4)
		clear
		sort -o student -k 1 student
		echo "Displaying file"
		cat student
		
		;;
		
		
	5)
		echo "Enter roll number to be deleted"
		read roll
		if grep -i "$roll" student
		then 
			echo "Record found and deleted."
			if grep -v -i "$roll" student > temp
			then 
			rm student						#remove
			mv temp student					#rename
			cat student 					#output
			fi
		else echo "Data not found"
		fi
		
		;;
		
	6)
		echo "Enter the roll number of the student to modify the data"
		read roll
		if grep -i "$roll" student
		then
			echo "Record found , modifying...."
			if grep -v -i "$roll" student > temp
			then
				rm student
				mv temp student
				echo "Enter name"
				read name
				echo "Enter marks in subject 1"
				read m1
				echo "Enter marks in subject 2"
				read m2
				echo "Enter marks in subject 3"
				read m3
				echo "$roll   $name   $m1   $m2   $m3" >> student
				sort -o student -k 1 student
				cat student
			fi
		else 
		echo " Data not found"
		fi
		
		;;	
		
		
	
	
	*) echo "Please enter a valid choice"
	
esac
done
	
		
		
