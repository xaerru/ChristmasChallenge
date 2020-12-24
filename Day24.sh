S=$(( $(date +%s -d "12/25/2020") - $( date +%s ) ));printf '%dh:%dm:%ds Until Christmas!!\n' $(($S/3600)) $(($S%3600/60)) $(($S%60))
