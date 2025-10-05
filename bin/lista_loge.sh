kopi_lexe_liste() {
    panlingue_x="../panlexia/generated/panlingue-$1.md"
    x_panlingue="../panlexia/generated/$1-panlingue.md"
    cp $panlingue_x $1
    cp $x_panlingue $1
}

kopi_lexe_liste_kon_altre_nim() {
    panlingue_x="../panlexia/generated/panlingue-$1.md"
    x_panlingue="../panlexia/generated/$1-panlingue.md"
    cp $panlingue_x $2
    cp $x_panlingue $2
}

kopi_data_do_lexia() {
    cp ../panlexia/generated/arb-panlingue.csv ./html/lexia/data
    cp ../panlexia/generated/cmn-panlingue.csv ./html/lexia/data
    cp ../panlexia/generated/deu-panlingue.csv ./html/lexia/data
    cp ../panlexia/generated/eng-panlingue.csv ./html/lexia/data
    cp ../panlexia/generated/epo-panlingue.csv ./html/lexia/data
    cp ../panlexia/generated/fas-panlingue.csv ./html/lexia/data
    cp ../panlexia/generated/fin-panlingue.csv ./html/lexia/data
    cp ../panlexia/generated/fra-panlingue.csv ./html/lexia/data
    cp ../panlexia/generated/ita-panlingue.csv ./html/lexia/data
    cp ../panlexia/generated/jpn-panlingue.csv ./html/lexia/data
    cp ../panlexia/generated/por-panlingue.csv ./html/lexia/data
    cp ../panlexia/generated/pol-panlingue.csv ./html/lexia/data
    cp ../panlexia/generated/rus-panlingue.csv ./html/lexia/data
    cp ../panlexia/generated/spa-panlingue.csv ./html/lexia/data
    cp ../panlexia/generated/tha-panlingue.csv ./html/lexia/data
}

fata_liste_panlingue_X() {
    #panlingue unodo
    cat panlingue-lexe.csv | awk -F "|" "{gsub(/\*/,\"\\\*\",\$2); print \$2	 \" - \" \$$1 \"  \"}" > $2/panlingue-$2.md
    #morta unodi linye
    sed -i '1d' $2/panlingue-$2.md
    # alfobeta
    sed -i 's/[A-Z] - .*$/####&/' $2/panlingue-$2.md
    #Add header
    sed -i "1s/^/# panlingue-$3\n/" $2/panlingue-$2.md
    #Delete empty translations
    sed -i '/-...$/d' $2/panlingue-$2.md
}

fata_liste_X_panlingue() {
    #ali bax unodo
    cat panlingue-lexe.csv | awk -F "|" "{gsub(/\*/,\"\\\*\",\$2); print \$$1 \" - \" \$2 \"  \"}" > $2/$2-panlingue.md
    #morta unodi linye
    sed -i '1d' $2/$2-panlingue.md
    # alfobeta
    cat $2/$2-panlingue.md | LC_ALL=C sort -f > temp/temp.txt
    cat temp/temp.txt | sed 's/[A-Z] - .*$/####&/' > $2/$2-panlingue.md
    #Add header
    sed -i "1s/^/# $3-panlingue\n/" $2/$2-panlingue.md
    #Delete empty translations
    sed -i '/^.-/d' $2/$2-panlingue.md
}

fata_leksasli_liste() {
#    cat panlingue-lexe.csv | awk -F "|" "{print \$$1 \$1 \$4 }" > $2/lexaslia.md
    cat panlingue-lexe.csv | awk -F "|" "{print \"|**\" \$2 \"**|\" \$$1 \"|\" \$5 \"|\"}" > $2/lexaslia.md
    #morta unodi linye
    sed -i '1d' $2/lexaslia.md
    #Sort
    LC_ALL=C sort -f $2/lexaslia.md --output $2/lexaslia.md
    #Add header row
    sed -i "1s/^/| panlingue | $2 | logasle |\n/" $2/lexaslia.md
    #Add header
    sed -i "1s/^/# panlingue-$3 ha logasle\n/" $2/lexaslia.md
    #Delete empty translations
    sed -i '/||/d' $2/lexaslia.md
    #xula linye 2
    sed 's/|\*\*--/|--/' -i $2/lexaslia.md
    sed 's/--\*\*|/--|/' -i $2/lexaslia.md
}

fata_liste() {
    echo cana logoliste pa $2
    fata_liste_panlingue_X $1 $2 $3
    fata_liste_X_panlingue $1 $2 $3
    fata_leksasli_liste $1 $2 $3
}

fata_lekse_asle() {
    cat panlingue-lexe.tsv | cut -f 2,5 > temp/lekse.txt
    sed -i '1d' temp/lekse.txt
    sed -i 's/\t/ ← /g' temp/lekse.txt
    awk ' { FS=" ← "; OFS=" ← "; t = $1; $1 = $2; $2 = t; print; } ' temp/lekse.txt > temp/temp.txt
    #Delete empty etymologies
    sed -i '/\ ← $/d' temp/temp.txt
    cat temp/abace.txt temp/temp.txt | sed 's/\t/@/g' | LC_ALL=C sort -f | sed 's/.00/##/g' | sed 's/@/ /g'> temp/lekse.txt
    #Add two spaces to line-ends
    sed 's/$/  /' -i temp/lekse.txt
    cat panlingue/loge_asle_supre.md temp/lekse.txt > panlingue/loge_asle.md
}

tarja_logaslia_pa_engli() {
    cd engli
    sed 's/amh:/Amharic:/' -i lexaslia.md
    sed 's/ara:/Arabic:/' -i lexaslia.md
    sed 's/ben:/Bengali:/' -i lexaslia.md
    sed 's/egy:/Egyptian-Arabic:/' -i lexaslia.md
    sed 's/ell:/Greek:/' -i lexaslia.md
    sed 's/eng:/English:/' -i lexaslia.md
    sed 's/fas:/Persian:/' -i lexaslia.md
    sed 's/fra:/French:/' -i lexaslia.md
    sed 's/ful:/Fulani:/' -i lexaslia.md
    sed 's/guj:/Gujarati:/' -i lexaslia.md
    sed 's/hak:/Hakka-Chinese:/' -i lexaslia.md
    sed 's/hau:/Hausa:/' -i lexaslia.md
    sed 's/hin:/Hindi:/' -i lexaslia.md
    sed 's/hun:/Hungarian:/' -i lexaslia.md
    sed 's/ibo:/Igbo:/' -i lexaslia.md
    sed 's/ita:/Italian:/' -i lexaslia.md
    sed 's/jpn:/Japanese:/' -i lexaslia.md
    sed 's/kan:/Kannada:/' -i lexaslia.md
    sed 's/khm:/Khmer:/' -i lexaslia.md
    sed 's/kon:/Kongo:/' -i lexaslia.md
    sed 's/kor:/Korean:/' -i lexaslia.md
    sed 's/lin:/Lingala:/' -i lexaslia.md
    sed 's/ltn:/Latin:/' -i lexaslia.md
    sed 's/mal:/Malayalam:/' -i lexaslia.md
    sed 's/mar:/Marathi:/' -i lexaslia.md
    sed 's/may:/Malay:/' -i lexaslia.md
    sed 's/min:/Min-Chinese:/' -i lexaslia.md
    sed 's/mya:/Burmese:/' -i lexaslia.md
    sed 's/orm:/Oromo:/' -i lexaslia.md
    sed 's/pnb:/Punjabi:/' -i lexaslia.md
    sed 's/pol:/Polish:/' -i lexaslia.md
    sed 's/por:/Portuguese:/' -i lexaslia.md
    sed 's/rus:/Russian:/' -i lexaslia.md
    sed 's/san:/Sanskrit:/' -i lexaslia.md
    sed 's/spa:/Spanish:/' -i lexaslia.md
    sed 's/swa:/Swahili:/' -i lexaslia.md
    sed 's/tam:/Tamil:/' -i lexaslia.md
    sed 's/tel:/Telugu:/' -i lexaslia.md
    sed 's/tgl:/Filipino:/' -i lexaslia.md
    sed 's/tha:/Thai:/' -i lexaslia.md
    sed 's/tur:/Turkish:/' -i lexaslia.md
    sed 's/urd:/Urdu:/' -i lexaslia.md
    sed 's/vie:/Vietnamese:/' -i lexaslia.md
    sed 's/wol:/Wolof:/' -i lexaslia.md
    sed 's/wuu:/Wu-Chinese:/' -i lexaslia.md
    sed 's/yor:/Yoruba:/' -i lexaslia.md
    sed 's/yue:/Cantonese:/' -i lexaslia.md
    sed 's/zho:/Mandarin:/' -i lexaslia.md
    sed 's/zul:/Zulu:/' -i lexaslia.md
    cd ..
}

tarja_logaslia_pa_suomi() {
    cd suomi
    sed 's/amh:/amhara:/' -i lexaslia.md
    sed 's/ara:/arabia:/' -i lexaslia.md
    sed 's/ben:/bangla:/' -i lexaslia.md
    sed 's/egy:/egyptinarabia:/' -i lexaslia.md
    sed 's/ell:/kreikka:/' -i lexaslia.md
    sed 's/eng:/englanti:/' -i lexaslia.md
    sed 's/fas:/persia:/' -i lexaslia.md
    sed 's/fra:/ranska:/' -i lexaslia.md
    sed 's/ful:/fulani:/' -i lexaslia.md
    sed 's/guj:/gujarati:/' -i lexaslia.md
    sed 's/hak:/hakkakiina:/' -i lexaslia.md
    sed 's/hau:/hausa:/' -i lexaslia.md
    sed 's/hin:/hindi:/' -i lexaslia.md
    sed 's/hun:/unkari:/' -i lexaslia.md
    sed 's/ibo:/igbo:/' -i lexaslia.md
    sed 's/ita:/italia:/' -i lexaslia.md
    sed 's/jpn:/japani:/' -i lexaslia.md
    sed 's/kan:/kannada:/' -i lexaslia.md
    sed 's/khm:/khmer:/' -i lexaslia.md
    sed 's/kon:/Kongo:/' -i lexaslia.md
    sed 's/kor:/korea:/' -i lexaslia.md
    sed 's/lin:/lingala:/' -i lexaslia.md
    sed 's/ltn:/latina:/' -i lexaslia.md
    sed 's/mal:/malayalam:/' -i lexaslia.md
    sed 's/mar:/marathi:/' -i lexaslia.md
    sed 's/may:/malaiji:/' -i lexaslia.md
    sed 's/min:/min-kiina:/' -i lexaslia.md
    sed 's/mya:/burma:/' -i lexaslia.md
    sed 's/orm:/oromo:/' -i lexaslia.md
    sed 's/pnb:/pandzabi:/' -i lexaslia.md
    sed 's/pol:/puola:/' -i lexaslia.md
    sed 's/por:/portugali:/' -i lexaslia.md
    sed 's/rus:/venäjä:/' -i lexaslia.md
    sed 's/san:/sanskriitti:/' -i lexaslia.md
    sed 's/spa:/espanja:/' -i lexaslia.md
    sed 's/swa:/suahili:/' -i lexaslia.md
    sed 's/tam:/tamili:/' -i lexaslia.md
    sed 's/tel:/telugu:/' -i lexaslia.md
    sed 's/tgl:/filippiini:/' -i lexaslia.md
    sed 's/tha:/thai:/' -i lexaslia.md
    sed 's/tur:/turkki:/' -i lexaslia.md
    sed 's/urd:/urdu:/' -i lexaslia.md
    sed 's/vie:/vietnami:/' -i lexaslia.md
    sed 's/wol:/wolof:/' -i lexaslia.md
    sed 's/wuu:/wu-kiina:/' -i lexaslia.md
    sed 's/yor:/yoruba:/' -i lexaslia.md
    sed 's/yue:/kantoninkiina:/' -i lexaslia.md
    sed 's/zho:/yleiskiina:/' -i lexaslia.md
    sed 's/zul:/zulu:/' -i lexaslia.md
    cd ..
}

tarja_logaslia_pa_esperanti() {
    cd esperanti
    sed 's/amh:/amhara:/' -i lexaslia.md
    sed 's/ara:/araba:/' -i lexaslia.md
    sed 's/ben:/bengala:/' -i lexaslia.md
    sed 's/egy:/egipta araba:/' -i lexaslia.md
    sed 's/ell:/greka:/' -i lexaslia.md
    sed 's/eng:/angla:/' -i lexaslia.md
    sed 's/fas:/persa:/' -i lexaslia.md
    sed 's/fra:/franca:/' -i lexaslia.md
    sed 's/ful:/fula:/' -i lexaslia.md
    sed 's/guj:/guĝarata:/' -i lexaslia.md
    sed 's/hak:/hakaa:/' -i lexaslia.md
    sed 's/hau:/haŭsa:/' -i lexaslia.md
    sed 's/hin:/hindia:/' -i lexaslia.md
    sed 's/hun:/hungara:/' -i lexaslia.md
    sed 's/ibo:/igba:/' -i lexaslia.md
    sed 's/ita:/itala:/' -i lexaslia.md
    sed 's/jpn:/japana:/' -i lexaslia.md
    sed 's/kan:/kanara:/' -i lexaslia.md
    sed 's/khm:/kmera:/' -i lexaslia.md
    sed 's/kon:/konga:/' -i lexaslia.md
    sed 's/kor:/korea:/' -i lexaslia.md
    sed 's/lin:/lingala:/' -i lexaslia.md
    sed 's/ltn:/latina:/' -i lexaslia.md
    sed 's/mal:/malajala:/' -i lexaslia.md
    sed 's/mar:/maratha:/' -i lexaslia.md
    sed 's/may:/malaja:/' -i lexaslia.md
    sed 's/min:/mina:/' -i lexaslia.md
    sed 's/mya:/birma:/' -i lexaslia.md
    sed 's/orm:/oroma:/' -i lexaslia.md
    sed 's/pnb:/panĝaba:/' -i lexaslia.md
    sed 's/pol:/polona:/' -i lexaslia.md
    sed 's/por:/portugala:/' -i lexaslia.md
    sed 's/rus:/rusa:/' -i lexaslia.md
    sed 's/san:/sanskrita:/' -i lexaslia.md
    sed 's/spa:/hispana:/' -i lexaslia.md
    sed 's/swa:/svahila:/' -i lexaslia.md
    sed 's/tam:/tamila:/' -i lexaslia.md
    sed 's/tel:/teluga:/' -i lexaslia.md
    sed 's/tgl:/filipina:/' -i lexaslia.md
    sed 's/tha:/taja:/' -i lexaslia.md
    sed 's/tur:/turka:/' -i lexaslia.md
    sed 's/urd:/urdua:/' -i lexaslia.md
    sed 's/vie:/vjetnama:/' -i lexaslia.md
    sed 's/wol:/volofa:/' -i lexaslia.md
    sed 's/wuu:/vua:/' -i lexaslia.md
    sed 's/yor:/joruba:/' -i lexaslia.md
    sed 's/yue:/kantona:/' -i lexaslia.md
    sed 's/zho:/mandarena:/' -i lexaslia.md
    sed 's/zul:/zulua:/' -i lexaslia.md
    cd ..
}


#dos2unix panlingue-lexe.csv
#sed 's/\t/|/g' -i panlingue-lexe.csv

cd ../panlexia
rm generated/*
sh tools/generate_bilingual_dictionaries.sh panlingue
cd ../panlingue

# chini e panlingue
kopi_lexe_liste cmn chini

# engli e panlingue
kopi_lexe_liste eng engli
#tarja_logaslia_pa_engli

# esperanti e panlingue
kopi_lexe_liste epo esperanti
#tarja_logaslia_pa_esperanti

# suomi e panlingue
kopi_lexe_liste fin suomi
#tarja_logaslia_pa_suomi

# franci e panlingue
kopi_lexe_liste fra franci

# itali e panlingue
#kopi_lexe_liste ita itali

# niponi e panlingue
kopi_lexe_liste jpn niponi

# malayi e panlingue
kopi_lexe_liste_kon_altre_nim ind may

# polski e panlingue
kopi_lexe_liste pol polski

# portugali e panlingue
kopi_lexe_liste por portugali

# rusi e panlingue
kopi_lexe_liste rus rusi

# espani e panlingue
kopi_lexe_liste spa espani

# itali e panlingue
kopi_lexe_liste tha tai

kopi_data_do_lexia
