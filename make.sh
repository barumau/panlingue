#!/bin/sh

kopi_lexeliste_do_altre_nim() {
    panlingue_x="$HOME/panlexia/generated/panlingue-$1.md"
    x_panlingue="$HOME/panlexia/generated/$1-panlingue.md"
    # Kopioi tiedostot oikeisiin kansioihin ja poista otsikot (ensimmäiset 5 riviä)
    #cp "$panlingue_x" ./docs/$2/ze_panlingue.md
    tail -n +6 "$panlingue_x" > ./docs/$2/ze_panlingue.md
    #cp "$x_panlingue" ./docs/$2/do_panlingue.md
    tail -n +6 "$x_panlingue" > ./docs/$2/do_panlingue.md
}

# Generate bilingual dictionaries from Panlexia.
cd ~/panlexia
rm ./generated/*
mkdir generated
sh tools/generate_bilingual_dictionaries.sh panlingue
cd ~/panlingue

# Copy dictionaries to different languages
kopi_lexeliste_do_altre_nim arb ar
kopi_lexeliste_do_altre_nim fas fa
kopi_lexeliste_do_altre_nim fin fi
kopi_lexeliste_do_altre_nim fra fr
kopi_lexeliste_do_altre_nim eng en
kopi_lexeliste_do_altre_nim epo eo
kopi_lexeliste_do_altre_nim ind id
kopi_lexeliste_do_altre_nim jpn ja
kopi_lexeliste_do_altre_nim pol pl
kopi_lexeliste_do_altre_nim por pt
kopi_lexeliste_do_altre_nim rus ru
kopi_lexeliste_do_altre_nim spa es
kopi_lexeliste_do_altre_nim tha th

# Build the website with MkDocs
mkdocs build
