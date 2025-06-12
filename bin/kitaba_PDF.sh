fa_pandoc() {
    pandoc $1/pan.md -V geometry:a4paper,margin=2cm -s -o $1/pan.pdf --pdf-engine=/usr/bin/xelatex -V mainfont="$2" -V monofont="DejaVu Sans Mono"
    #-V CJKmainfont="MS Mincho" #-V CJKmainfont="Noto Sans CJK SC" -V devanagarifont="Noto Sans Devanagari"
    sed 's/\/home\/rkupsala\/pandunia\/html/http:\/\/www.pandunia.info/g' -i $1/pan.md
}

max_dataje_nam() {
    if test -f "$1"; then
        echo "zai $1"
        echo $1 >> temp/dataje_liste.txt
    #else
        #echo "no zai $1"
    fi
}

fa_dataje_liste() {
    max_dataje_nam $1/000_dake.md
    max_dataje_nam $1/I-idea.md
    max_dataje_nam $1/G-baze.md
    max_dataje_nam $1/G-ABC.md
    max_dataje_nam $1/G-PoS.md
    max_dataje_nam $1/G-N.md
    max_dataje_nam $1/G-ADJ.md
    max_dataje_nam $1/G-NUM.md
    max_dataje_nam $1/G-PRO.md
    max_dataje_nam $1/G-V.md
    max_dataje_nam $1/G-PP.md
    max_dataje_nam $1/G-P.md
    max_dataje_nam $1/G-AFX.md
    max_dataje_nam $1/K-kurse.md
#    max_dataje_nam $1/I_esperanto_vs_panlingue.md
}

fa_pan_md() {
    echo
    echo "kitaba la $1 PDF dokumen"
    rm temp/dataje_liste.txt
    touch temp/dataje_liste.txt
    fa_dataje_liste $1
    cat temp/dataje_liste.txt | xargs -d "\n" cat -- > $1/pan.md

    #la sube kitaba ha 'unicode' harfe e simbol, ki 'pandoc' no bil kitaba.
    #101_dunia_loga.md 200_baze_jumla.md

    # uze la loka di grafe
    #sed 's/http:\/\/www.pandunia.info/\/home\/risto\/pandunia\/html/g' -i $1/pan.md
    sed 's/http:\/\/www.pandunia.info/\/home\/rkupsala\/pandunia\/html/g' -i $1/pan.md
}

fa_europi_dokume() {
    fa_pan_md $1
    #fa_pandoc $1 "DejaVu Serif"
    fa_pandoc $1 "FreeSerif"
}

fa_niponi_dokume() {
    fa_pan_md $1
    fa_pandoc $1 "Noto Serif CJK JP"
}

fa_chini_dokume() {
    fa_pan_md $1
    fa_pandoc $1 "Noto Serif CJK SC"
}

fa_europi_dokume eng
fa_europi_dokume epo
fa_europi_dokume fra
fa_europi_dokume pol
fa_europi_dokume rus
fa_europi_dokume spa
fa_europi_dokume fin

fa_niponi_dokume jpn

fa_chini_dokume cmn

#uza di pake:
#sudo apt install pandoc
#sudo apt install pdflatex
#sudo apt-get install texlive-latex-base
#sudo apt-get install texlive-fonts-recommended
#sudo apt-get install texlive-fonts-extra
#sudo apt-get install texlive-latex-extra
#sudo apt-get install texlive-xetex
#
#
# See the current list of fonts
# fc-list | less
#
# Intall "Free Serif"
# sudo apt install fonts-freefont-ttf
#
# Install Noto fonts (over 600 MB)
# sudo apt install fonts-noto
#
# Install "Noto Serif CJK" just for Chinese, Japanese and Korean
# sudo apt install fonts-noto-cjk
