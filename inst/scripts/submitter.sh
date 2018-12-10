#!/bin/bash

curval=$1
prefix=$(echo $curval | sed "s/\\.Rmd$//" | sed "s/^make-data-//")

sbatch << EOF
#!/bin/bash
#SBATCH -o ${prefix}.out 
#SBATCH -e ${prefix}.err
#SBATCH -n 1
#SBATCH --mem 16000 

Rdevel -e "rmarkdown::render('${curval}')" --no-save --vanilla
EOF
