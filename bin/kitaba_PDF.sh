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
    max_dataje_nam $1/001_indute.md
#    max_dataje_nam $1/dunia_baxe.md
    max_dataje_nam $1/101_bazi_kanune.md
    max_dataje_nam $1/102_ABC.md
    max_dataje_nam $1/103_lex-tipe.md
    max_dataje_nam $1/104_nam-lexe.md
    max_dataje_nam $1/105_sif-lexe.md
    max_dataje_nam $1/106_mod-lexe.md
    max_dataje_nam $1/107_nume.md
    max_dataje_nam $1/108_vis-lexe.md
    max_dataje_nam $1/109_kar-lexe.md
    max_dataje_nam $1/110_jumle.md
    max_dataje_nam $1/201_dunia_lexe.md
    max_dataje_nam $1/202_lex-bine.md
    max_dataje_nam $1/darse.md
#    max_dataje_nam $1/404_esperanto_vs_panlingue.md
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

fa_europi_dokume eng
fa_europi_dokume epo
fa_europi_dokume fra
fa_europi_dokume pol
fa_europi_dokume rus
#fa_europi_dokume spa
fa_europi_dokume fin

fa_niponi_dokume jpn

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
