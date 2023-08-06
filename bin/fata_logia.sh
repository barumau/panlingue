cat panlingue-loge.csv | awk -F'|' '{print $2,$1,$3,$4,$5,$6,$7$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21,$22,$23}' OFS='|' > temp/panlingue-loge.csv
cat ../git/ibnteo.github.io/panlingue/logia_mul.html temp/panlingue-loge.csv ../git/ibnteo.github.io/panlingue/logia_fin.html > html/panlingue/logia.html

