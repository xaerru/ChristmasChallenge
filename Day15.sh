while [[ $(( $(date +%s -d "12/25/2020") - $( date +%s ) )) > 0 ]] 
    do
        echo "$(( $(date +%s -d "12/25/2020") - $( date +%s ) )) seconds till Christmas" | figlet -c
    done

