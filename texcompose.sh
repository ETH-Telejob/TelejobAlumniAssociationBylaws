#!/bin/bash

    start=$(date +%s)
    printf "Step 1/6 - pdflatex\n"
    #pdflatex -halt-on-error -interaction=nonstopmode main.tex > main.txt
    pdflatex -halt-on-error TelejobAlumniAssociationBylaws.tex | grep '^!.*' -A200 --color=always
    # pdflatex main 

    printf "Step 2/6 - bibtex\n"
    bibtex TelejobAlumniAssociationBylaws.aux > TelejobAlumniAssociationBylaws.txt | grep '^!.*' -A200 --color=always
    # bibtex main.aux > main.txt 

    printf "Step 3/6 - makeglossaries\n"
    makeglossaries TelejobAlumniAssociationBylaws | grep '^!.*' -A200 --color=always
    # makeglossaries main  

    printf "Step 4/6 - makeindex\n"
    makeindex TelejobAlumniAssociationBylaws.nlo -q -s nomencl.ist -o TelejobAlumniAssociationBylaws.nls | grep '^!.*' -A200 --color=always
    # makeindex main 

    printf "Step 5/6 - pdflatex\n"
    #pdflatex -halt-on-error -interaction=nonstopmode main.tex > main.txt
    pdflatex -halt-on-error TelejobAlumniAssociationBylaws.tex | grep '^!.*' -A200 --color=always
    # pdflatex  main 

    printf "Step 6/6 - pdflatex\n"
    #pdflatex -halt-on-error -interaction=nonstopmode main.tex > main.txt
    pdflatex -halt-on-error TelejobAlumniAssociationBylaws.tex | grep '^!.*' -A200 --color=always
    # pdflatex  main 

    rm -f TelejobAlumniAssociationBylaws.ilg TelejobAlumniAssociationBylaws.txt TelejobAlumniAssociationBylaws.aux TelejobAlumniAssociationBylaws.bbl TelejobAlumniAssociationBylaws.blg TelejobAlumniAssociationBylaws.out TelejobAlumniAssociationBylaws.toc TelejobAlumniAssociationBylaws.brf TelejobAlumniAssociationBylaws.lof TelejobAlumniAssociationBylaws.lot TelejobAlumniAssociationBylaws.nlo TelejobAlumniAssociationBylaws.nls TelejobAlumniAssociationBylaws.acn TelejobAlumniAssociationBylaws.glo TelejobAlumniAssociationBylaws.glsdefs TelejobAlumniAssociationBylaws.ist TelejobAlumniAssociationBylaws.acr TelejobAlumniAssociationBylaws.alg TelejobAlumniAssociationBylaws.glg TelejobAlumniAssociationBylaws.gls texput.log TelejobAlumniAssociationBylaws.log
    #rm -rf main.log
    end=$(date +%s)
    seconds=$(echo "$end - $start" | bc)
    echo 'Job done, time taken (sec):'
    awk -v t=$seconds 'BEGIN{t=int(t*1000); printf "%d:%02d:%02d\n", t/3600000, t/60000%60, t/1000%60}'

