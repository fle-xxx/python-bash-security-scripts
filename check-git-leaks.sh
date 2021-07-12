prog_name=$1;
page_amount=$2;
one=1;
page_amount_minus_1="$(($2-$one))"



if [[ ("$prog_name" == "-h") || ("$prog_name" == "")]]; then

        echo "Type program name. If needed, type page amount as second argument.";

        exit 1;

fi

	echo -e "Collect 1st page"; 



	curl --silent "https://github.com/$prog_name" | grep -oP '(?<=\" href=\"\/'$prog_name'\/).*(?=class)' | tr -d '\"' >> repos




if [[ ("$page_amount" != "")]]; then


	echo -e "Collect alse" $page_amount_minus_1 "pages"; 



	for (( i=2; i<=$page_amount+1; i++ )) do

		curl --silent "https://github.com/$prog_name?page=$i" | grep -oP '(?<=\" href=\"\/'$prog_name'\/).*(?=class)' | tr -d '\"' >> repos


	done

        

fi


	wc repos; echo -e "All repos count"




while IFS= read line

	do 


          
            gitleaks --repo-url=https://github.com/$prog_name/$line --verbose
		 



	done < repos | grep '\"' > gitout

rm repos; 


'
Gets program name. For example qiwi. And page amount from https://github.com/qiwi. = 4
Then scan all repos with gitleaks.
Usage:
./check-git-leaks.sh qiwi 4
