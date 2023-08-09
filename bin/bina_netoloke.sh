bina_MkDocs() {
  cd mkdocs/$1
  mkdocs build
  cd ../..
}

muta_GitHub_dokumsanduke() {
    grep -rl "edit\/master\/docs" html/$1 | xargs sed -i "s/edit\/master\/docs/edit\/master\/$1/g"
}

bina_netoloke() {
    echo bina netoloke pa $1
    bina_MkDocs $1
    muta_GitHub_dokumsanduke $1
}

bina_pane() {
    bina_netoloke cmn
    bina_netoloke eng
    bina_netoloke spa
    bina_netoloke epo
    bina_netoloke fra
    bina_netoloke jpn
    bina_netoloke panlingue
    bina_netoloke pol
    bina_netoloke por
    bina_netoloke rus
    bina_netoloke fin
}

bina_pane

