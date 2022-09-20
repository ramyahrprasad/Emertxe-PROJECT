#!/bin/bash
var=y									#store y in one variable
while [ $var = "y" ]							#use while loop
do
	echo "1.signup							
	      2.sign in
	      3.exit"							#select the choice

	      read -p "enter the choice" n				#read choice
	      case $n in						#open switch case

		      1)						#sign up page
			      arr=(`cat user.csv`)			#store the user.csv file into an array 
				count=1					#initialize count=1

				while [ $count -eq 1 ]			#use while loop
				do
					count=0				#if count is equal to zero
						echo "enter the user name" 	#enter the user name
						read username			#read username

						for i in ${arr[@]} 		#use for loop for array elements
						do
							if [ $username = $i ]	#check username is present in the loop
							then
								count=1		#if username is already exits read again
								echo "user name already exits"
							fi
						done
				done
								echo $username >> user.csv	#append the username to user.csv file
								
						
		count=1										#initialize count is equal to one
		while [ $count -eq 1 ]								#use while loop
		do
			count=0									#if count is zero
			echo "enter the password"						#enter the password
			read -s password							#read the password
			echo "enter the conformation password"					#enter the conformation password
			read -s password							#read the password

			for j in  ${arr1[@]}							#use for loop for array elements
			do
				if [ $password = $j ]						#check password is present in the password.csv file
				then
					count=1							#if password already exixts read again
					
					echo "password already exits"				
				fi
			done
		done
		echo "password matched"								#print password matched
		echo $password >> password.csv
		;;
		


	2)											#sign in page
user=(`cat  user.csv`)										#store the user.csv into array
password=(`cat password.csv`)									#store the password.csv file into an array
count=1
while [ $count -eq 1 ]										#check the condition count is equal to one
do
	count=0											#initialize count is equal to zero
	echo "enter the user name"								#enter the username
	read username										#read the user name

	for k in `seq 0 $((${#user[@]}-1))`							#use for loop for the array length
	do
		if [ $username = ${user[k]} ]							#check the username is present in the array
		then
			position=$k								#store the length in the one variable
		fi
	done

			echo "enter the password"						#enter the password
			read -s password							#read password
			if [ $password = ${password[position]} ]				#check the password is present in that position or not
			then
				count=1								#password and username are nont matched read again
				
				echo "user name password or not matched read again"
			fi
		done
				echo "sign in is succesful"					#print the signin successfull
				echo "1.take a test		
				      2.exit"							#test page
				      read -p "enter the user choice " num			#read the choice
				      case $num in
					      1)
						      for l in `seq 5 6 60`			#use loop
						      do
							      head -$l question.txt | tail -5	#command used to display starting 5 lines from the question.txt file
							      sleep 2				#this command used for time delay
						      
						      for m in `seq 10 -1 1`			#use loop
						      do
							      sleep 3
							      echo -n -e "\r enter the read option: $m \c" #enter the option
						      done
							      read -t 1 option				#read option
							      if [ -n  "$option" ]			#check option
							      then 
								      break				#break
							      else
								      option="e"			#default option e
							      fi
						      done
						      echo $option					#print option
						      echo $option >> useranswer.txt
						      ;;
					     *)
							     echo "exit"
							     ;;
					     esac
	
				;;
			*)
			  	echo "exit"						#default case for exit
				;;
		esac									#end case
		read -p "do you want to continue (y/n) :?" yn				#prompting the user 
		case $yn in								#case yes or no
			yy)
				;;
			*)
				exit
				;;
		esac									#end case
	done
